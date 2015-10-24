"use strict";

// module Node.GM

var gm = require('gm');
var im = require('gm').subClass({ imageMagick: true });

exports.gm = gm;

exports.im = im;

exports.gmTest = function(gm) {
  return function() {
    console.log(gm);
  };
};

exports.gmFile = function(gm) {
  return function(file) {
    return function() {
      return gm(file);
    };
  };
};

exports.gmBuffer = function(gm) {
  return function(buffer) {
    return function(name) {
      return function() {
        return gm(buffer, name);
      };
    };
  };
};


