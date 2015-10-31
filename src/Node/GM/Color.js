"use strict";

// module Node.GM.Color

var toHexImpl = function(n) {
  return n.toString(16);
};

exports.toHexI = toHexImpl;
exports.toHexN = toHexImpl;
