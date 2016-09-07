var express = require('express');
var router = express.Router();
var path = require('path');
var scriptPath = path.resolve('scripts', 'main.sh');

/* GET home page. */
router.get('/', function(req, res, next) {
  if (req.headers['user-agent'].indexOf('curl') === 0) {
    res.sendFile(scriptPath);
  } else {
    res.render('index', {
      url: process.env.HOST || 'http://localhost:3000'
    });
  }
});

module.exports = router;
