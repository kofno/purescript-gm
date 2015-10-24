"use strict";

// module Node.GM.Aff

exports.writeEff = function(file) {
  return function(gobj) {
    return function(success) {
      return function(failure) {
       return function() {
          gobj.write(file, function(err) {
            if (err) failure(err)();
            else     success()();
          });
        };
      }
    };
  };
};

exports.toBufferEff = function(gmobj) {
  return function(success) {
    return function(failure) {
      return function() {
        gmobj.toBuffer(function(err, buffer){
          if (err) failure(err)();
          else     success(buffer)();
        });
      };
    };
  };
};

exports.toBufferFormatEff = function(format) {
  return function(gmobj) {
    return function(success) {
      return function(failure) {
        return function() {
          gmobj.toBuffer(format, function(err, buffer) {
            if (err) failure(err)();
            else     success(buffer)();
          });
        };
      };
    };
  };
};
