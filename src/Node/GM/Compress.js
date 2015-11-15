"use string";

// module Node.GM.Compress


exports.compress = function(compression) {
  return function(gobj) {
    return function() {
      return gobj.compress(compression);
    };
  };
};
