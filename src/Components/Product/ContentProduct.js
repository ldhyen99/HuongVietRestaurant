import React, { Component } from 'react';
import Product from '.';
import axios from 'axios'
import AddProduct from './AddProduct';

const getProductData = () =>
  axios.get('/menu')
    .then((res) => res.data)

const addProductAction = (TenMoiMon, DonGia, SoLuongConLai, ImgLink) =>
  axios.post('/menu', { TenMoiMon, DonGia, SoLuongConLai, ImgLink })
    .then((res) => res.data)

const deleteProduct = (MaMoiMon) =>
  axios.put('/menu', { MaMoiMon })
    .then((res) => res.data)

class ContentProduct extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: null,
      MonAnObjeEdit: {}
    };
  }

  // UNSAFE_componentWillMount() {
  //   if (this.state.data === null) {
  //     getProductData().then((res) => {
  //       this.setState({
  //         data: res.recordset
  //       }
  //       )
  //     })
  //   }
  // }

  handleClick = (TenMoiMon, DonGia, SoLuongConLai, ImgLink) => {
    //  var {TenMoiMon,DonGia,SoLuongConLai,ImgLink} = this.state
    var dataTemp = [];
    var item = {}
    item.TenMoiMon = TenMoiMon
    item.DonGia = DonGia
    item.SoLuongConLai = SoLuongConLai
    item.ImgLink = ImgLink

    console.log(dataTemp);

    dataTemp = this.state.data
    console.log(dataTemp);

    if (item.TenMoiMon !== '') {
      dataTemp.push(item)
      this.setState({
        data: dataTemp
      })
    }
    console.log(dataTemp);


    // addProductAction(TenMoiMon, DonGia, SoLuongConLai, ImgLink).then((res) => {
    //   console.log(res)
    // })

    console.log(TenMoiMon);


  }

  handleDelete = (idMoiMon) => {
    // var {MaMoiMon}=this.state
    var tempData = this.state.data.filter(item => item.MaMoiMon !== idMoiMon)
    this.setState({
      data: tempData,
    })
    // deleteProduct(idMoiMon).then((res) => {
    //   console.log(res)
    // })

  }



  //"https://kenh14cdn.com/2018/3/31/anh-ba-3-1522515382689364607840.jpg"
  displayData = () => {
    if (this.state.data !== null) {
      return (this.state.data && this.state.data.map((value, key) =>

        <Product
          handleDelete={(idMoiMon) => this.handleDelete(idMoiMon)}
          key={key}
          note={value}
          MaMoiMon={value.MaMoiMon}
          TenMoiMon={value.TenMoiMon}
          SoLuongCL={value.SoLuongConLai}
          GiaTien={value.DonGia + '.000'}
          ImgLink={value.ImgLink}
        />

      ))
    }
  }
  checkStatus = (event) => {
    var names = event.target.name
    var values = event.target.value
    this.setState({
      [names]: values
    })
    console.log(names);

  }


  render() {
    return (
      <div>
        <h2 className="text-center mb-5">Menu</h2>

        <div className="container-fluid">

          <div className="row">
            <div className="col">
              <div className="row">

                {this.displayData()}
              </div>

            </div>
            <div className="col-4">
              <div className="row">
                <AddProduct handleClick={(TenMoiMon, DonGia, SoLuongConLai, ImgLink) => this.handleClick(TenMoiMon, DonGia, SoLuongConLai, ImgLink)} />
              </div>
            </div>
          </div>

        </div>

      </div>
    );
  }
}

export default ContentProduct;