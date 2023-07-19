"use strict";

globalThis._call = PointJSCore.call;
globalThis._callSync = PointJSCore.callSync;
globalThis._bizCallbacks = {};

/**
 * generate normal native call argv for point
 * @param {string} module
 * @param {string} method
 * @param {object} params
 * @param {boolean} sync
 * @param {int} callbackId
 * @returns {object}
 */
globalThis._genCallArgv = (module, method, params = null, sync = false, callbackId = null) => {
    console.log(sync + module + method + params + callbackId);
  return {
    type: sync ? 1 : 0,
    module: module,
    method: method,
    params: params,
    callbackId: callbackId,
  };
};

/**
 * persist callback in runtime, and get an int id
 * @param {function} callback
 * @returns {int}
 */
globalThis._persistCallback = (callback) => {
  let callback_id = Date.now();
  globalThis._bizCallbacks[callback_id] = callback;
  return callback_id;
};

/**
 * trigger js call for native callback
 * @param {int} callback_id
 * @param {string} params native response object json string
 * @returns
 */
globalThis._nativeCallback = (callback_id, params) => {
  let callback = globalThis._bizCallbacks[callback_id];
  if (callback === undefined && typeof callback !== "function") {
    return;
  }
  let obj = JSON.parse(params);
  callback(obj);
};

globalThis.WOSAI = {
  checkProperty: (parent, property) => {
    var prop_arr = property.split(".");
    var obj = parent;
    for (var i = 0; i < prop_arr.length; i++) {
      var item = prop_arr[i];
      if (obj[item]) {
        obj = obj[item];
      } else {
        return false;
      }
    }
    return true;
  },

  setProperty: (parent, key, property) => {
    var prop_arr = key.split(".");
    if (!parent[prop_arr[0]]) {
      parent[prop_arr[0]] = {};
    }
    parent[prop_arr[0]][prop_arr[1]] = property;
  },

  getUrlParams: (url) => {
    var params = {};
    if (url.indexOf("?") != -1) {
      var urls = url.split("?");
      var arr = urls[1].split("&");
      for (var i = 0, l = arr.length; i < l; i++) {
        var a = arr[i].split("=");
        params[a[0]] = a[1];
      }
    }
    return params;
  },

  bindIfAbsent: (func_name, fn) => {
    if (!checkProperty(globalThis, func_name)) {
      setProperty(globalThis, func_name, fn);
    }
  },
};
