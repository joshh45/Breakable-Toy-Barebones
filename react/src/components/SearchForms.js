import React from 'react';

const SearchForms = props => {

  return (
    <div>
      <form>
        <label>
        Location:
          <input type="text" placeholder="Enter Location" onChange={props.handleLocationChange}/>
        </label>

        <label>
        Activity:
        <input type= "text" placeholder = "Enter thing to do" onChange={props.handleActivityChange}/>
        </label>
        <input id="react_button" type="submit" value="Start Your Adventure" onClick={props.handleSubmit}/>
      </form>

    </div>
  );
};


export default SearchForms;
