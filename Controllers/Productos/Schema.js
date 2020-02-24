var mongoose = require('mongoose');

var Schema = mongoose.Schema;
const Producto = mongoose.Schema({
  _id: Schema.ObjectId,
  Nombre: String,
  Descripcion: String,
  IdCategoria: String,
  Cantidad: Number,
  Precio: Number,
  colores: [{
    color: String
  }],
  tallas: [{
    talla: String
  }]
});
module.exports.Producto = mongoose.model('productos', Producto, 'productos');