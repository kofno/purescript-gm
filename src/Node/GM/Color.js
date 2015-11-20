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

exports.bitdepth = function(depth) {
  return function(gobj) {
    return function() {
      return gobj.bitdepth(depth);
    };
  };
};

exports.bluePrimaryImpl = function(x) {
  return function(y) {
    return function(gobj) {
      return function() {
        return gobj.bluePrimary(x, y);
      };
    };
  };
};

exports.channelImpl = function(channel) {
  return function(gobj) {
    return function() {
      return gobj.channel(channel);
    };
  };
};

exports.colorize = function(r) {
  return function(g) {
    return function(b) {
      return function(gobj) {
        return function() {
          return gobj.colorize(r, g, b);
        };
      };
    };
  };
};

exports.colorMap = function(type) {
  return function(gobj) {
    return function() {
      return gobj.colorMap(type);
    };
  };
};

exports.colors = function(int) {
  return function(gobj) {
    return function() {
      return gobj.colors(int);
    };
  };
};

exports.contrast = function(multiplier) {
  return function(gobj) {
    return function() {
      return gobj.contrast(multiplier);
    };
  };
};

var toHexImpl = function(n) {
  return n.toString(16);
};

exports.toHexI = toHexImpl;
