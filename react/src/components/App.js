import React, { Component } from 'react';
import SearchForms from './SearchForms';
import LocationList from './LocationList';

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      location: "",
      activity: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleLocationChange = this.handleLocationChange.bind(this);
    this.handleActivityChange = this.handleActivityChange.bind(this);

  }

  handleLocationChange(event) {
    let newLocation = event.target.value;
    this.setState({ location: newLocation });
  }

  handleActivityChange(event) {
    let newActivity = event.target.value;
    this.setState({ activity: newActivity });
  }

  handleSubmit(event) {
    let activity = this.state.activity
    let location = this.state.location
    event.preventDefault();

    let fetchBody = {
      yelp_search_params: {
        location: location,
        activity: activity
      }
    };

    fetch('/api/v1/locations/yelp_api_search',
    { method: "POST",
    headers: { 'Content-Type': 'application/json' },
    credentials: 'same-origin',
    body: JSON.stringify(fetchBody) })
    .then(response => {
       if (response.ok) {
         return response;
       } else {
         let errorMessage = `${response.status} (${response.statusText})`,
         error = new Error(errorMessage);
         throw(error);
       }
     })
    .then(function(response) {
      let newLocation = response.json();
      return newLocation;
    }).then((response) =>
    this.setState({
    })
  );
}


  render() {
    return(
      <div>
        <SearchForms
        handleSubmit={this.handleSubmit}
        handleActivityChange={this.handleActivityChange}
        handleLocationChange={this.handleLocationChange}
        />
        <br/>
        <h1> ADD A C00L LIST OF STUFF </h1>
        <LocationList/>
      </div>



    );
  }
}


export default App;
