var express = require('express');
var router = express.Router();
var pg = require('pg');

var conString = "postgres://dev:shadow@localhost/jamsesh";



/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;
