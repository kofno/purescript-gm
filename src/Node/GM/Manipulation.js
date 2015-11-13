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

exports.blackThresholdImpl = function(rgba) {
  return function(gobj) {
    return function() {
      return gobj.blackThreshold(rgba);
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

exports.borderColorImpl = function(color) {
  return function(gobj) {
    return function() {
      return gobj.borderColor(color);
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

exports.channelImpl = function(channel) {
  return function(gobj) {
    return function() {
      return gobj.channel(channel);
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

exports.coalesce = function(gobj) {
  return function() {
    return gobj.coalesce();
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


