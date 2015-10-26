"use strict";

// module Node.GM.Manipulation

exports.adjoin = function(gobj) {
  return function() {
    return gobj.adjoin();
  };
};

exports.affineImpl = function(matrix) {
  return function(gobj) {
    return function() {
      return gobj.affine(matrix);
    };
  };
};

exports.antialias = function(bool) {
  return function(gobj) {
    return function() {
      return gobj.antialias(bool);
    };
  };
};

exports.appendImpl = function(imgs) {
  return function(direction) {
    return function(gobj) {
      return function() {
        return gobj.append(imgs, direction);
      };
    };
  };
};

exports.authenticate = function(pw) {
  return function(gobj) {
    return function() {
      return gobj.authenticate(pw);
    };
  };
};

exports.autoOrient = function(gobj) {
  return function() {
    return gobj.autoOrient();
  };
};

exports.average = function(gobj) {
  return function() {
    return gobj.average();
  };
};

exports.backdrop = function(gobj) {
  return function() {
    return gobj.backdrop();
  };
};

exports.bitdepth = function(depth) {
  return function(gobj) {
    return function() {
      return gobj.bitdepth(depth);
    };
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


