var express = require('express');

var bodyParser = require('body-parser');

var app = express();

var http = require('http').Server(app);

var io = require('socket.io')(http);

var mongoose = require('mongoose');

var connection = require('./connection.js');

var routerProductos = require('./Controllers/Productos/ProductosController');

var routerTallas = require('./Controllers/Tallas/TallasController');


app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Origin", "http://localhost:8100","*", "http://localhost:4200","http://localhost", "http://172.16.214.70", "http://172.16.214.70:5000"); // update to match the domain you will make the request from
  res.header("Access-Control-Allow-Headers","*");
  res.header("Access-Control-Allow-Headers", "Accept-Encoding, Accept-Language, Access-Control-Request-Headers, Access-Control-Request-Method, Connection, Host, Referer, Origin, X-Requested-With, Content-Type, Accept, X-DevTools-Emulate-Network-Conditions-Client-Id, User-Agent");
    next();
 
});

app.use(express.static(__dirname));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: false
})); //Routes

app.use('/Productos', routerProductos);
app.use('/Tallas', routerTallas);

app.io = io;
io.on('connection', () => {
  console.log('user is connected');
});
var server = http.listen(5000, () => {
  console.log('server is running on port', server.address().port);
});