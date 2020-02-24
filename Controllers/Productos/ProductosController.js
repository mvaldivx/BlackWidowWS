var connection = require("../../connection.js");

var express = require('express');

var Producto = require('./Schema.js');

const router = express.Router();


router.get('/getProductos', (req, res) => {
  if(!req.query.posicion)  res.sendStatus(400)
  else{
    var query = " SELECT p.IdProducto, p.Nombre, p.Descripcion, rp.Cantidad, "
    + " p.Precio,t.IdTalla, t.Talla,c.IdColor, c.Color , p2.num"
    + " FROM Productos p "
    + " JOIN prodtallacolor rp ON p.IdProducto = rp.IdProducto AND rp.Cantidad > 0"
    + " JOIN Tallas t ON rp.IdTalla = t.IdTalla"
    + " JOIN Colores c ON c.IdColor = rp.IdColor"
    + " JOIN (select Distinct p.IdProducto, ROW_NUMBER() OVER ( Order by p.FechaRegistro) as num FROM Productos p"
    + " JOIN prodtallacolor rp ON p.IdProducto = rp.IdProducto"
    + " group by p.IdProducto"
    + " Order by p.FechaRegistro desc"
    + " )p2 ON p2.IdProducto = p.Idproducto"
    + " AND p2.num BETWEEN " + Number(req.query.posicion) + " AND " + Number(req.query.posicion)+30;

      connection.query(query,(err,result,fields)=>{
          if(err){
              console.log('getProductos','ControllerProductos',err.sqlMessage)
              res.sendStatus(500)
          }
          var productos= []
          result.forEach(element => {
            if(!productos.map(function(n){return n.IdProducto} ).includes(element.IdProducto)){
              productos.push(element);
            }
          });
          var final=[]
          productos.forEach(e =>{
            var tallas = 
            result.filter(function(t){return (t.IdProducto === e.IdProducto)}).map(function(n){ return {
              IdTalla : n.IdTalla,Talla: n.Talla,
              IdColor: n.IdColor, Color: n.Color, Cantidad: n.Cantidad
            };})
            var grouped = tallas.reduce(function(r,a){
              r[a.Talla] = r[a.Talla]||[];
              r[a.Talla].push({IdColor: a.IdColor, Color: a.Color, Cantidad: a.Cantidad});
              return r;
            },Object.create(null));
            
            e.Tallas = Object.keys(grouped).map(function(key){
              return {'Talla':key,'Colores':grouped[key]}
            })
            final.push({
                IdProducto: e.IdProducto,
                Nombre: e.Nombre,
                Descripcion: e.Descripcion,
                Precio: e.Precio,
                num: e.num,
                Tallas: e.Tallas
              })
          })

          //console.log(productos)
          //console.log(result)
         res.send(final)
      })
  }
  
  /*Producto.Producto.find({}, function (err, prod) {
    res.send(prod);
  });*/
});

router.get('/getInfoProducto', (req, res) => {
  if(!req.query._id)  res.sendStatus(400)
  else{
    var query = " SELECT p.IdProducto, p.Nombre, p.Descripcion, rp.Cantidad, "
    + " p.Precio,t.IdTalla, t.Talla,c.IdColor, c.Color"
    + " FROM Productos p "
    + " JOIN prodtallacolor rp ON p.IdProducto = rp.IdProducto and rp.Cantidad > 0"
    + " JOIN Tallas t ON rp.IdTalla = t.IdTalla"
    + " JOIN Colores c ON c.IdColor = rp.IdColor"
    + " Where p.IdProducto = " + req.query._id
    + " ORDER BY t.idTalla"
      connection.query(query,(err,result,fields)=>{
          if(err){
              console.log('getInfoProducto','ControllerProductos',err.sqlMessage)
              res.sendStatus(500)
          }
          var productos= []
          result.forEach(element => {
            if(!productos.map(function(n){return n.IdProducto} ).includes(element.IdProducto)){
              productos.push(element);
            }
          });
          var final={}
          productos.forEach(e =>{
            var tallas = 
            result.filter(function(t){return (t.IdProducto === e.IdProducto)}).map(function(n){ return {
              IdTalla : n.IdTalla,Talla: n.Talla,
              IdColor: n.IdColor, Color: n.Color, Cantidad: n.Cantidad
            };})
            var grouped = tallas.reduce(function(r,a){
              r[a.Talla] = r[a.Talla]||[];
              r[a.Talla].push({IdColor: a.IdColor, Color: a.Color, Cantidad: a.Cantidad});
              return r;
            },Object.create(null));
            e.Tallas = Object.keys(grouped).map(function(key){
              return {'Talla':key,'Colores':grouped[key]}
            })
            final={
                IdProducto: e.IdProducto,
                Nombre: e.Nombre,
                Descripcion: e.Descripcion,
                Precio: e.Precio,
                Tallas: e.Tallas
              }
          })

          //console.log(productos)
          //console.log(result)
         res.send(final)
      })
  }
});

router.post('/registraProducto', (req, res) => {
  var producto = new Producto.Producto({
    _id: new mongoose.Types.ObjectId(),
    ...req.body.Producto
  });
  producto;
  producto.save(err => {
    req.app.io.emit('producto', req.body);
    res.sendStatus(200);
  });
});


router.get('/getColores', (req, res) => {
  var color = new Producto.Color(req.body);
  Producto.Color.find({
    idProducto: color._id
  }, (err, productos) => {
    res.send(productos);
  });
});


module.exports = router;