"use strict";

// module PureGM

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

exports.autoOrient = function(gobj) {
  return function() {
    return gobj.autoOrient();
  };
};

exports.flipImage = function(gobj) {
  return function() {
    return gobj.flip();
  };
};

exports.flopImage = function(gobj) {
  return function() {
    return gobj.flop();
  };
};

exports.resize = function(dims) {
  return function(gobj) {
    return function() {
      return gobj.resize(dims.width, dims.height);
    };
  };
};

exports.resizeWidth = function(width) {
  return function(gobj) {
    return function() {
      return gobj.resize(width);
    };
  };
};

exports.resizeHeight = function(height) {
  return function(gobj) {
    return function() {
      return gobj.resize(null, height);
    };
  };
};

exports.write = function(file) {
  return function(gobj) {
    return function(success) {
      return function(failure) {
       return function() {
          gobj.write(file, function(err) {
            if (err) failure(err)();
            else     success()();
          });
        };
      }
    };
  };
};
