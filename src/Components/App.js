import React, { Component } from 'react';
import './index.css';
import HeadTitle from '../Layout/HeadTitle';
import axios from 'axios'
import Nav from '../Layout/Nav';
import { BrowserRouter as Router } from 'react-router-dom';
import MakeRoute from './MakeRoute';

// Nhận dữ liệu từ api, lấy về lưu trữ , promise
// const getProductData = () =>
//   axios.get('/menu')
//     .then((res) => res.data)
// //  function(res){return res.data} 


class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: null,
      TenMoiMon: '',
      DonGia: '',
      SoLuongConLai: '',
      ImgLink: '',
      MaMoiMon: '',
    }
  }

  // UNSAFE_componentDidMount() {
  //   if (this.state.data === null) {
  //     getProductData().then((res) => {
  //       this.setState({
  //         data: res.data
  //       }
  //       )
  //     })
  //   }
  // }




  //   handleClick = (TenMoiMon,DonGia,SoLuongConLai,ImgLink) => {
  //     //  var {TenMoiMon,DonGia,SoLuongConLai,ImgLink} = this.state
  //       var dataTemp = [];
  //       var item = {}
  //       item.TenMoiMon = TenMoiMon
  //       item.DonGia = DonGia
  //       item.SoLuongConLai = SoLuongConLai
  //       item.ImgLink = ImgLink

  //       console.log(dataTemp);

  //      dataTemp=this.state.data
  //      console.log(dataTemp);

  //      if(item.TenMoiMon !== '') {
  //       dataTemp.push(item)
  //       this.setState({
  //         data:dataTemp
  //       })
  //      }
  //      console.log(dataTemp);


  //       addProductAction(TenMoiMon,DonGia,SoLuongConLai,ImgLink).then((res)=>{
  //         console.log(res)
  //       })

  //     console.log(TenMoiMon);


  //  }      


  render() {
    console.log(this.state);

    return (
      <Router>
        <div>
          <HeadTitle />
          <Nav />
          <MakeRoute />
        </div>
      </Router>
    );
  }
}
export default App;

