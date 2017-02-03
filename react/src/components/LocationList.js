import React from 'react';

const LocationList = props => {

  let list = props.data.map((activity) => {
    return(
      <div className="row">
      <div className="small-6 centered columns medium-centered columns large-centered columns">
        <div className="items">
            <br/>
            <h1><img src={activity.image_url}/></h1>
            <p> {activity.name} </p>
            <p> {activity.rating} </p>
            <p><img src={activity.rating_img_url}/></p>
            <p>{activity.location.display_address.join(" ")}</p>
            <p><a href={activity.url}>Learn More</a></p>
            <br/>
            <br/>
        </div>
      </div>
      </div>
    );
  });

  return (
    <div>
      {list}
    </div>

  );
};

export default LocationList;
