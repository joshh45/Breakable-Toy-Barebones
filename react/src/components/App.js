import React, { Component } from 'react';
import SearchForms from './SearchForms';
import LocationList from './LocationList';

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      location: "",
      activity: "",
      data: [],
      addto: []
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleLocationChange = this.handleLocationChange.bind(this);
    this.handleActivityChange = this.handleActivityChange.bind(this);
    this.handleAddTo = this.handleAddTo.bind(this);


  }

  handleLocationChange(event) {
    let newLocation = event.target.value;
    this.setState({ location: newLocation });
  }

  handleActivityChange(event) {
    let newActivity = event.target.value;
    this.setState({ activity: newActivity });
  }

// add to button
  handleAddTo(name, img_url, rating, rating_url, address, url){

    let fetchBody = {
      AddName : name,
      AddImgUrl : img_url,
      AddRating : rating,
      AddRating_url : rating_url,
      AddAddress : address,
      AddUrl : url
    };

    fetch('/api/v1/users_locations',
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
     });
  }

// handle react search bar
  handleSubmit(event) {
    let activity = this.state.activity;
    let location = this.state.location;
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
    }).then((response) =>{
    this.setState({
      data: response['businesses']
    });
  });
}






  render() {
    return(
      <div>
        <h1> (┛◉Д◉)┛彡┻━┻ </h1>
        <SearchForms
        handleSubmit={this.handleSubmit}
        handleActivityChange={this.handleActivityChange}
        handleLocationChange={this.handleLocationChange}
        />
        <br/>
        <br/>
        <LocationList
        data={this.state.data}
        addto={this.handleAddTo}
        />
      </div>



    );
  }
}


export default App;
