"use strict";

// module Node.GM.Compose

exports.compose = function(operator) {
  return function(gobj) {
    return function() {
      return gobj.compose(operator);
    };
  };
};
