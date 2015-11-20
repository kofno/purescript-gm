"use strict";

// module Node.GM.Multiple

exports.adjoin = function(gobj) {
  return function() {
    return gobj.adjoin();
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
