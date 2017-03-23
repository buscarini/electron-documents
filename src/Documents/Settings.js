/* globals getItemForeign, setItem */
"use strict";

const electron = require('electron');
const settings = require('electron-settings');

exports.getItemForeign = function (callback) {
  return function (key) {
    return function () {
      return settings.get(key).then(function(val) {
            callback(val)();
          }
        );
    };
  };
};

exports.setItemForeign = function (callback) {
  return function (key) {
    return function (value) {
      return function () {
        settings.set(key, value).then(callback());
      };
    };
  };
};

/*
exports.removeItem = function (callback) {
  function (key) {
    return function () {
      settings.delete(key).then(() => callback()() )
    }
  }
}

exports.clear = function (callback) {
  function () {
    return function () {
      settings.clear().then(() => callback()())
    }
  }
}
*/
