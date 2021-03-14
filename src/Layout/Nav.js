import React, { Component } from 'react';
import {
    NavLink
} from "react-router-dom";
import i1 from "../Components/Home/pics/HuongViet.png";


class Nav extends Component {

    render() {
        return (
            <div className="container fontroboto">
                <a className="navbar-brand text-center">
                    <img src={i1} alt=""></img>
                </a>
                <ul className="nav justify-content float-right" >
                    {/* <ul class="nav navbar-nav float-right"> */}
                    <li>
                        <NavLink className="inactive" activeClassName="active" to="/HuongVietRestaurant/">Home</NavLink>
                    </li>
                    <li >
                        <NavLink className="inactive" activeClassName="active" to="/HuongVietRestaurant/menu">Menu</NavLink>
                    </li>
                    <li >
                        <NavLink className="inactive" activeClassName="active" to="/HuongVietRestaurant/sign-in">Sign In</NavLink>
                    </li>
                    <li >
                        <NavLink className="inactive" activeClassName="active" to="/HuongVietRestaurant/sign-up">Sign Up</NavLink>
                    </li>
                    <li >
                        <NavLink className="datbanmenu" activeClassName="active" to="/HuongVietRestaurant/sign-up">Reservation</NavLink>
                    </li>
                </ul>
            </div>

        );
    }
}

export default Nav;