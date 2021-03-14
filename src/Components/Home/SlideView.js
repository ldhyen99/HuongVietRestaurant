import React, { Component, useState, useEffect, useRef } from 'react';
import ImgComp from './ImgComp';
import i1 from './pics/slide02.jpg';
import i2 from './pics/slide01.jpg';
import i3 from './pics/slider03.jpg';


function SlideView() {
    const [x, setX] = useState(0);

    useEffect(() => {
        setTimeout(() => {
            goRight()
        }, 5000);
    }, [x])

    let slideArr = [<ImgComp src={i1} />, <ImgComp src={i2} />, <ImgComp src={i3} />]

    const goLeft = () => {
        console.log(x);
        x === 0 ? setX(-100 * (slideArr.length - 1)) : setX(x + 100);

        // setX( x + 100);
    };
    const goRight = () => {
        console.log(x);
        x === -100 * (slideArr.length - 1) ? setX(0) : setX(x - 100);

    };

    return (

        <div className="slider"> {
            slideArr.map((value, key) => {
                return (
                    <div key={key} className="slide" style={{ transform: `translateX(${x}%)` }}>
                        {value}
                    </div>
                )
            })
        }
            <button id="goLeft" onClick={goLeft}>
                <i class='fas fa-chevron-left'></i>
            </button>
            <button id="goRight" onClick={goRight}> <i class='fas fa-chevron-right'></i></button>
        </div>
    );

}

export default SlideView;



