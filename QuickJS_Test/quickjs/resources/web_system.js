"use strict";

//箭头函数
WOSAI.web = {
  /**
   * get SQB runtime env by sync function
   * @returns {object} object of envs {code, message, data}
   */

  //可选入参,直接return结果
  callSync: (param) => {
    console.log(">>>WOSAI.web.callSync: " + JSON.stringify(param));
    let params = _genCallArgv("web", "callSync", param, true);
    console.log(">>>WOSAI.web.callSync_genCallArgv: " + JSON.stringify(params));
    let res = _callSync(JSON.stringify(params));
    console.log(">>>WOSAI.web.callSync_callSync: " + JSON.stringify(params));
    return JSON.parse(res);
  },

  //可选入参,通过callback异步回调
  callAsync: (param, callback) => {
    console.log(">>>WOSAI.web.callAsyncWithParam: " + callback);
    let params = _genCallArgv("web", "callAsync", param, false, callback); //生成参数
    console.log(">>>WOSAI.web.callAsyncWithParam_genCallArgv: " + JSON.stringify(param));
    let res = _call(JSON.stringify(params));
    console.log(">>>WOSAI.web.callAsyncWithParam_call: " + res);
    callback(JSON.parse(res));
  },
};


//传统函数声明
//WOSAI.web = {
//  /**
//   * get SQB runtime env by sync function
//   * @returns {object} object of envs {code, message, data}
//   */
//
//  //可选入参,直接return结果
//  callSync(param) {
//    console.log(">>>WOSAI.web.callSync: " + JSON.stringify(param));
//    let params = _genCallArgv("web", "callSync", param, true);
//    console.log(">>>WOSAI.web.callSync_genCallArgv: " + JSON.stringify(params));
//    let res = _callSync(JSON.stringify(params));
//    console.log(">>>WOSAI.web.callSync_callSync: " + JSON.stringify(params));
//    return JSON.parse(res);
//  },
//
//  //可选入参,通过callback异步回调
//  callAsync(param, callback) {
//    console.log(">>>WOSAI.web.callAsyncWithParam: " + callback);
//    let params = _genCallArgv("web", "callAsync", param, false, callback); //生成参数
//    console.log(">>>WOSAI.web.callAsyncWithParam_genCallArgv: " + JSON.stringify(param));
//    let res = _call(JSON.stringify(params));
//    console.log(">>>WOSAI.web.callAsyncWithParam_call: " + res);
//    callback(JSON.parse(res));
//  },
//};

