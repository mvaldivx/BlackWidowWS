var mongoose = require('mongoose');

var Schema = mongoose.Schema;
const TallaSchema = mongoose.Schema({
  talla: String
});
module.exports.Talla = mongoose.model('tallas', TallaSchema, 'tallas');