"use strict";

// module Node.GM.ColorSpace


exports.colorSpace = function(cs) {
  return function(gobj) {
    return function() {
      return gobj.colorspace(cs);
    };
  };
};
