import React, { Component } from 'react';

class AddProduct extends Component {
    constructor(props) {
        super(props);
        this.state={
            TenMoiMon:'',
            DonGia:'',
            SoLuongConLai:'',
            ImgLink:'',
            MaMoiMon:'',
            displayCreate:false

        }
    }

    checkStatus = (event) => {
        var names = event.target.name
        var values = event.target.value
        this.setState({
            [names]:values
        })
        
    }

   
   
    // handleClick = (TenMoiMon,DonGia,SoLuongConLai,ImgLink) => {
    //   //  console.log(JSON.stringify(this.state));
    //    this.props.handleClick()

    // }
    changeStatus = () => {
      this.setState({
        displayCreate:!this.state.displayCreate
      })
    }

    displayButtonCreate = () => {
      if(this.state.displayCreate === true) 
      {
        return <div className="btn btn-block btn-outline-secondary mb-3" onClick={()=> this.changeStatus()}>Đóng lại</div>
      }
      else 
      {
        return <div className="btn btn-block btn-outline-info mb-3" onClick={()=> this.changeStatus()}>Thêm mới</div>
      }
    }

    displayFormCreate = () => {
      if(this.state.displayCreate === true) 
      {
        return (
          <form>
          <div className="form-group">
            <label htmlFor="TenMoiMon">Tên sản phẩm</label>
            <input onChange={(event)=>this.checkStatus(event)}
            type="text" className="form-control" name="TenMoiMon" 
            id="TenMoiMon" aria-describedby="textName" placeholder="Nhập tên sản phẩm" />
            <small id="textName" className="form-text text-muted">Input the text</small>
          </div>
          <div className="form-group">
            <label htmlFor="DonGia">Giá</label>
            <input onChange={(event)=>this.checkStatus(event)} 
            type="text" className="form-control" name="DonGia" id="DonGia" 
            aria-describedby="textName" placeholder="Nhập tên sản phẩm" />
            <small id="textName" className="form-text text-muted">Input number</small>
          </div>
          <div className="form-group">
            <label htmlFor="SoLuongConLai">Số lượng</label>
            <input onChange={(event)=>this.checkStatus(event)} type="text" className="form-control" 
            name="SoLuongConLai" id="SoLuongConLai" aria-describedby="textName" 
            placeholder="Nhập tên sản phẩm" />
            <small id="textName" className="form-text text-muted">Input number</small>
          </div>

          <div className="form-group">
            <label htmlFor="ImgLink">Link ảnh</label>
            <input onChange={(event)=>this.checkStatus(event)} type="text" className="form-control" 
            name="ImgLink" id="ImgLink" aria-describedby="textName" 
            placeholder="Nhập tên sản phẩm" />
            <small id="textName" className="form-text text-muted">Input the text</small>
          </div>
          <button type="reset" onClick={(TenMoiMon,DonGia,SoLuongConLai,ImgLink)=>this.props.handleClick(this.state.TenMoiMon,this.state.DonGia,this.state.SoLuongConLai,this.state.ImgLink)} className="btn btn-info btn-block">Thêm mới</button>
        </form>
        )
      }
      else return null
      
    }
    render() {        
        return (
            <div className="col">   
           <div className ="row">
             <div className="col-12"><hr/>
             </div>
             <div className="col-8 mx-auto">
             {this.displayButtonCreate()}
             {this.displayFormCreate()}

             
            </div>
          </div>
                      </div>

        );
    }
}

export default AddProduct;