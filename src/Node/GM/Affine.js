"use strict";

// module Node.GM.Affine

exports.affineImpl = function(matrix) {
  return function(gobj) {
    return function() {
      return gobj.affine(matrix);
    };
  };
};

