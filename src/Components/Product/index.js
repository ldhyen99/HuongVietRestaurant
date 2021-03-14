import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import {connect} from 'react-redux'


class Product extends Component {
    
    
    toSlug = (str) => {
        str = str.toLowerCase();     
    // xóa dấu
    str = str.replace(/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/g, 'a');
    str = str.replace(/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/g, 'e');
    str = str.replace(/(ì|í|ị|ỉ|ĩ)/g, 'i');
    str = str.replace(/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/g, 'o');
    str = str.replace(/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/g, 'u');
    str = str.replace(/(ỳ|ý|ỵ|ỷ|ỹ)/g, 'y');
    str = str.replace(/(đ)/g, 'd');
 
    // Xóa ký tự đặc biệt
    str = str.replace(/([^0-9a-z-\s])/g, '');
 
    // Xóa khoảng trắng thay bằng ký tự -
    str = str.replace(/(\s+)/g, '-');
 
    // xóa phần dự - ở đầu
    str = str.replace(/^-+/g, '');
 
    // xóa phần dư - ở cuối
    str = str.replace(/-+$/g, '');
 
    // return
    return str;
    }
   
    handleDelete = (idMoiMon) => {
        console.log("id cua phan tu: " + idMoiMon);
        this.props.handleDelete(idMoiMon)
        
    }
    
    handleClick = event => {
        event.preventDefault()
    //
    }

    handldeEdit = () => {  
         this.props.getEditData(this.props.note)
          
       }  
   
    render() {
        
        return (
        <div className="col-3">
        <div className="card text-left">
        <a href={"/menu/" + this.props.MaMoiMon } onClick={(event)=>this.handleClick(event)}>
            <img className="card-img-top" src={this.props.ImgLink} alt="" /></a>
            <div className="card-body">
        <b className="text-center float-left">{this.props.TenMoiMon}</b>
            <i className=" text-center float-right">{this.props.GiaTien}</i>
            </div>
            <p className=" text-center">Số lượng còn lại: {this.props.SoLuongCL}</p>
            <Link to={"/menu/" + this.props.MaMoiMon }onClick={(event)=>this.handleClick(event)} >
            <button type="submit" className="btn btn-danger btn-block" onClick={(idMoiMon)=>this.handleDelete(this.props.MaMoiMon)}>Xóa</button>
            </Link>
            <Link to={"/edit/" + this.props.MaMoiMon}  >
            <button type="submit" className="btn btn-warning mt-2 btn-block " onClick={()=>this.handldeEdit()} >Sửa</button>
            </Link>
        </div>
      
        </div>
           

        );
    }
}

const mapDispatchToProps = (dispatch, ownProps) => {
    return {
        getEditData: (editObject) => {
            dispatch({
                type:"GET_EDIT_DATA",
                editObject
            })
        }
    }
}
export default connect(null, mapDispatchToProps)(Product)