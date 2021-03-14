import React, { Component } from 'react';
import axios from 'axios';
import {connect} from 'react-redux'
import { Link } from 'react-router-dom';


const UpdateProduct = (MaMoiMon,TenMoiMon,DonGia,SoLuongConLai,ImgLink) => 
     axios.post('/edit/' ,{MaMoiMon,TenMoiMon,DonGia,SoLuongConLai,ImgLink})
    .then((res)=>res.data)


// const getPEditData = () => 
//         axios.get('/edit/' + params.id)
//         .then( (res)=>res.data )



class EditProduct extends Component {
    constructor(props) {
        super(props);
        this.state = {
            TenMoiMon: '',
            DonGia:'',
            SoLuongConLai:'',
            ImgLink:'',
            MaMoiMon:''
           
        }
    }
  
   

    UNSAFE_componentWillMount() {
    if(this.props.editItem) {
      this.setState({
        TenMoiMon:this.props.editItem.TenMoiMon,
        DonGia:this.props.editItem.DonGia,
        SoLuongConLai:this.props.editItem.SoLuongConLai,
        ImgLink:this.props.editItem.ImgLink,
        MaMoiMon:this.props.editItem.MaMoiMon
      });
         }
    }

  addData = (MaMoiMon,TenMoiMon,DonGia,SoLuongConLai,ImgLink) => {
    if(this.state.MaMoiMon) {
      var editObjec={}
      editObjec.MaMoiMon = this.state.MaMoiMon
      editObjec.TenMoiMon = this.state.TenMoiMon
      editObjec.DonGia = this.state.DonGia
      editObjec.SoLuongConLai = this.state.SoLuongConLai
      editObjec.ImgLink = this.state.ImgLink
      
      // UpdateProduct(MaMoiMon,TenMoiMon,DonGia,SoLuongConLai,ImgLink).then((res)=>{
      //   console.log(res)
      // })
    }
   

  }
    
    checkStatus = (event) => {
        var names = event.target.name
        var values = event.target.value
        this.setState({
            [names]:values
        })
     
    }
  
    render() {
      console.log(this.state);
      
        return (
            <div>
            <h2 className="text-center mb-5">Sửa món ăn</h2>

            <div className="container">
                <div className="row">
                    <div className="col">
                 <form>
          <div className="form-group">
            <label htmlFor="TenMoiMon">Tên sản phẩm</label>
            <input defaultValue={this.props.editItem.TenMoiMon} onChange={(event)=>this.checkStatus(event)}
            type="text" className="form-control" name="TenMoiMon" 
            id="TenMoiMon" aria-describedby="textName" placeholder="Nhập tên sản phẩm" />
            <small id="textName" className="form-text text-muted">Input the text</small>
          </div>
          <div className="form-group">
            <label htmlFor="DonGia">Giá</label>
            <input defaultValue={this.props.editItem.DonGia} onChange={(event)=>this.checkStatus(event)} 
            type="text" className="form-control" name="DonGia" id="DonGia" 
            aria-describedby="textName" placeholder="Nhập tên sản phẩm" />
            <small id="textName" className="form-text text-muted">Input number</small>
          </div>
          <div className="form-group">
            <label htmlFor="SoLuongConLai">Số lượng</label>
            <input defaultValue={this.props.editItem.SoLuongConLai} onChange={(event)=>this.checkStatus(event)} type="text" className="form-control" 
            name="SoLuongConLai" id="SoLuongConLai" aria-describedby="textName" 
            placeholder="Nhập tên sản phẩm" />
            <small id="textName" className="form-text text-muted">Input number</small>
          </div>

          <div className="form-group">
            <label htmlFor="ImgLink">Link ảnh</label>
            <input defaultValue={this.props.editItem.ImgLink} onChange={(event)=>this.checkStatus(event)} type="text" className="form-control" 
            name="ImgLink" id="ImgLink" aria-describedby="textName" 
            placeholder="Nhập tên sản phẩm" />
            <small id="textName" className="form-text text-muted">Input the text</small>
          </div>
          <Link to={"/menu/"} >
          <button type="reset" onClick={(MaMoiMon,TenMoiMon,DonGia,SoLuongConLai,ImgLink)=>this.addData(this.state.MaMoiMon,this.state.TenMoiMon,this.state.DonGia,this.state.SoLuongConLai,this.state.ImgLink)} className="btn btn-info btn-block">Sửa</button>
          </Link>
        </form>
        </div>
            </div>
            </div>
            </div>
        );
    }
}
const mapStateToProps = (state, ownProps) => {
  return {
    editItem: state.editItem
  }
}

// const mapDispatchToProps = (dispatch, ownProps) => {
//   return {
//       getEditData: (editObject) => {
//           dispatch({
//               type:"GET_EDIT_DATA",
//               editObject
//           })
//       }
//   }
// }
export default connect(mapStateToProps, null)(EditProduct)