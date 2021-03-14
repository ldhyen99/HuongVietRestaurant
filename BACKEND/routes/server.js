

// function getMoiMon() {
//     var dbConn = new sql.ConnectionPool(dbconfig);
//     dbConn.connect().then(function () {
//         var request = new sql.Request(dbConn);
//         request.query("select * from MoiMon").then(function (resp) {
//             console.log(resp.recordset);
  
//             dbConn.close();
//         }).catch(function (err) {
//             console.log(err);
//             dbConn.close();
//         });
//     }).catch(function (err) {
//         console.log(err);
//     });
//   }

