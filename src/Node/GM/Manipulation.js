"use strict";

// module Node.GM.Manipulation

exports.antialias = function(bool) {
  return function(gobj) {
    return function() {
      return gobj.antialias(bool);
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

exports.backdrop = function(gobj) {
  return function() {
    return gobj.backdrop();
  };
};

exports.blurImpl = function(r) {
  return function(s) {
    return function(gobj) {
      return function() {
        return gobj.blur(r, s);
      };
    };
  };
};

exports.borderImpl = function(w) {
  return function(h) {
    return function(gobj) {
      return function() {
        return gobj.border(w, h);
      };
    };
  };
};


exports.boxImpl = function(color) {
  return function(gobj) {
    return function() {
      return gobj.box(color);
    };
  };
};

exports.charcoal = function(factor) {
  return function(gobj) {
    return function() {
      return gobj.charcoal(factor);
    };
  };
};

exports.chopImpl = function(w) {
  return function(h) {
    return function(x) {
      return function(y) {
        return function(gobj) {
          return function() {
            return gobj.chop(w, h, x, y);
          };
        };
      };
    };
  };
};

exports.clip = function(gobj) {
  return function() {
    return gobj.clip();
  };
};

exports.comment = function(text) {
  return function(gobj) {
    return function() {
      return gobj.comment(text);
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


