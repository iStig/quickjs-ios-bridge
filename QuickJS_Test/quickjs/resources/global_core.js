"use strict";

globalThis._call = SQBJSCore.call;
globalThis._callSync = SQBJSCore.callSync;
globalThis._bizCallbacks = {};

/**
 * generate normal native call argv for SQB
 * @param {string} module
 * @param {string} method
 * @param {object} params
 * @param {boolean} sync
 * @param {function} callback
 * @returns {object}
 */
globalThis._genCallArgv = (module, method, params = null, sync = false, callback) => {
    let callback_id = 0;
    console.log('>>>11111');

    if(callback !== undefined){
        console.log('>>>2222');

//        console.log(callback);
        callback_id = globalThis._persistCallback(callback);
//        console.log('>>>33333');

    }
    return {
    type: sync ? 1 : 0,
    module: module,
    method: method,
    params: params,
    callbackId: callback_id,
    };
};

/**
 * persist callback in runtime, and get an int id
 * @param {function} callback
 * @returns {int}
 */
globalThis._persistCallback = (callback) => {
//    console.log('49500');

  let callback_id = Date.now();
//  console.log(callback_id);
  globalThis._bizCallbacks[callback_id] = callback;
//  console.log(globalThis._bizCallbacks);
  return callback_id;
};

/**
 * trigger js call for native callback
 * @param {int} callback_id
 * @param {string} params native response object json string
 * @returns
 */
globalThis._nativeCallback = (callback_id, params) => {
    console.log('8888');

//    console.log('8888'+callback_id);
//    console.log('**'+params);

  let callback = globalThis._bizCallbacks[callback_id];
//    console.log('7777'+callback);
//    console.log('1111'+params);
  if (callback === undefined && typeof callback !== "function") {
    return;
  }
  console.log('1111**'+JSON.stringify(params));
//  let obj = JSON.parse(params);
//  console.log('4424455**'+obj);

  callback(params);
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
