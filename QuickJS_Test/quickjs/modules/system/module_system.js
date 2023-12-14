"use strict";

WOSAI.system = {
  /**
   * get SQB runtime env by sync function
   * @returns {object} object of envs {code, message, data}
   */
  //无callback
  env: () => {
    console.log(">>>WOSAI.system.env");
    let params = _genCallArgv("system", "env", null, true);
    console.log(">>>WOSAI.system.env_genCallArgv: " + JSON.stringify(params));
    let res = _callSync(JSON.stringify(params));
    console.log(">>>WOSAI.system.env_callSync: " + res);
    return JSON.parse(res);
  },
};

//有callback
WOSAI.location = {
  position: (param, callback)  => {
    console.log(">>>WOSAI.location.position: " + callback);
    let params = _genCallArgv("location","position",param,false,callback); //生成参数
    console.log(">>>WOSAI.location.position_genCallArgv: " + JSON.stringify(param));
    let res = _call(JSON.stringify(params));
    console.log(">>>WOSAI.location.position_call: " + res);
    callback(JSON.parse(res));
  },
};
