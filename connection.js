/*const mongoose = require('mongoose');

var dbUrl = 'mongodb+srv://mauvalsa:36839421@cluster0-816mj.mongodb.net/Blackwidow?retryWrites=true&w=majority';
mongoose.connect(dbUrl, {
  useNewUrlParser: true
}).then(() => {
  console.log('Connected succesfull');
}).catch(err => {
  console.log('mongodb connected', err);
});
module.exports = mongoose;*/

var mysql = require('mysql');

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "mauvalsa",
    database: "blackwidow"
  });
  
  con.connect(function(err) {
    if (err){ 
      console.log(err)
      throw err;
    }
    console.log("Connected!");
  });

module.exports = con;