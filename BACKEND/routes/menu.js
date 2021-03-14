var express = require('express');
var router = express.Router();
// var sql = require("mssql");

// // mssql config
// var dbconfig = {
//   user: 'sa',
//   password: '123456',
//   server: 'localhost',
//   option: {
//     instancename: 'SQLEXPRESS',
//     port: 4143,
//     database: 'HuongVietResto',

//   }
// };

// /* GET home page. */
// // router.get('/', function(req, res, next) {

// //   getMoiMon()
// //   res.render('index',{title:'Express'});
// // });

// // insert data to sql
// // router.get('/edit/?',function(req,res,next) {
// //   var MaMoiMon = req.body.MaMoiMon
// //  var query = "Select TenMoiMon, SoLuongConLai,DonGia,ImgLink from MoiMon where MaMoiMon='" + req.query.IdMoiMon + "'"
// //  // var query= "Select * from MoiMon"
// // console.log(query);
// //  // res.send('da nhan du lieu name: ' + req.params.id)
// //  getMoiMon(res,query)

// // })

// // router.get('/menu/',function(req,res,next) {
// //  // res.render('delete',{})
// // });

// router.put('/menu', (req, res, next) => {
//   var MaMoiMon = req.body.MaMoiMon
//   console.log(MaMoiMon);

//   //var TenMM = req.body.TenSP
//   var query = "delete from MoiMon where MaMoiMon='" + MaMoiMon + "'"
//   console.log(query);
//   // res.send('da nhan du lieu name: ' + req.params.id)
//   getMoiMon(res, query)

// });

// // Update data
// router.post('/edit/', (req, res, next) => {
//   var MaMoiMon = req.body.MaMoiMon,
//     TenMoiMon = req.body.TenMoiMon,
//     DonGia = req.body.DonGia,
//     SoLuongConLai = req.body.SoLuongConLai,
//     ImgLink = req.body.ImgLink
//   console.log(MaMoiMon);

//   var query = "UPDATE MoiMon SET TenMoiMon=N'" + TenMoiMon + "', DonGia='" + DonGia + "', SoLuongConLai='" + SoLuongConLai + "', ImgLink='" + ImgLink + "' where MaMoiMon='" + MaMoiMon + "' "
//   console.log(query);
//   // res.send('da nhan du lieu name: ' + MaMoiMon)

//   getMoiMon(res, query)

// });
// router.post('/menu', function (req, res, next) {
//   var TenMoiMon = req.body.TenMoiMon,
//     DonGia = req.body.DonGia,
//     SoLuongConLai = req.body.SoLuongConLai,
//     ImgLink = req.body.ImgLink
//   // let query = "exec LoginMember @SSN='" + ssn + "', @PASSWORD='" + password + "';";
//   var query = "exec dbo.USP_ADD_MoiMon  @TenSP=N'" + TenMoiMon + "', @GiaTien='" + DonGia + "', @SL='" + SoLuongConLai + "', @img='" + ImgLink + "';"
//   console.log(query);
//   // res.send('da nhan du lieu name: ' + productName + productPrice + productSL)
//   getMoiMon(res, query)
// });

// //Get data from sql
// router.get('/menu', function (req, res, next) {

//   var query = "select * from MoiMon"
//   getMoiMon(res, query)
// });


// var getMoiMon = function (res, query) {
//   sql.connect(dbconfig, function (err) {
//     if (err) {
//       console.log("Error al conectarse a la base :- " + err);
//       res.send(err);
//     }
//     else {
//       // create Request object
//       var request = new sql.Request();
//       // query to the database
//       request.query(query, function (err, result) {
//         if (err) {
//           console.log("Error al correr query en la base :- " + err);
//           res.send(err);
//         }
//         else {
//           res.send(result);
//         }
//       });
//     }
//   });
// }
// function getThanhVien() {
//   var dbConn = new sql.ConnectionPool(dbconfig);
//   dbConn.connect().then(function () {
//     var request = new sql.Request(dbConn);
//     request.query("select * from ThanhVien").then(function (resp) {
//       console.log(resp.recordset);
//       dbConn.close();
//     }).catch(function (err) {
//       console.log(err);
//       dbConn.close();
//     });
//   }).catch(function (err) {
//     console.log(err);
//   });
// }

// Get all list menu
router.post('/v1/Menu/Search', (req,res) => {

})

// Update one food on menu
router.patch('/v1/Menu/Update', (req,res) => {

})

// Delete food on menu
router.post('v1/Menu/Delete', (req,res) => {

})



module.exports = router;
