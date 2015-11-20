"use strict";

// module Node.GM.Color

exports.blackThresholdImpl = function(rgba) {
  return function(gobj) {
    return function() {
      return gobj.blackThreshold(rgba);
    };
  };
};

exports.borderColorImpl = function(color) {
  return function(gobj) {
    return function() {
      return gobj.borderColor(color);
    };
  };
};

var toHexImpl = function(n) {
  return n.toString(16);
};

exports.toHexI = toHexImpl;
