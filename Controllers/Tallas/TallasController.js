var mongoose = require('mongoose');

var express = require('express');

var Talla = require('./Schema');

const routerTallas = express.Router();
routerTallas.get('/getTallas', (req, res) => {
  Talla.Talla.find({}, function (err, talla) {
    res.send(talla);
  });
});
routerTallas.post('/registraTalla', (req, res) => {
  var talla = new Talla.Talla(req.body);
  talla.save(err => {
    res.sendStatus(200);
  });
});
module.exports = routerTallas;