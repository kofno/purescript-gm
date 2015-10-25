"use strict";

// module Node.GM.Manipulation

exports.adjoin = function(gobj) {
  return function() {
    return gobj.adjoin();
  };
};

exports.affine = function(matrix) {
  return function(gobj) {
    return function() {
      var s = matrix.value0;
      var r = matrix.value1;
      var maybe = matrix.value2
      var t = maybe.value0
      var ms = s.x + "," + r.x + "," + r.y + "," + s.y;
      if (t) {
        ms = ms + "," + t.x + "," + t.y;
      }
      return gobj.affine(ms);
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


