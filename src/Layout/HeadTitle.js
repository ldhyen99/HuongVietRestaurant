import React, { Component } from 'react';

class HeadTitle extends Component {

    render() {
        return (
            <div className="topheader">
  <div className="container">
    <div className="row">
      <div className="col-sm-6">
          
        <div className="datban">
          Call for reservation: +011 29 345 678
        </div>
      </div>
      <div className="col-sm-6 ">
        <div className="datban openingtop float-sm-right text-sm-left text-xs-center">
          Opening Hours : 9:00am - 10:00pm
        </div>
      </div>
    </div> 
  </div> 
</div> 

        );
    }
}

export default HeadTitle;