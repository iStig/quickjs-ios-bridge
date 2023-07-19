"use strict";

WOSAI.system = {
  /**
   * get point runtime env by sync function
   * @returns {object} object of envs {code, message, data}
   */
  env: () => {
    let params = _genCallArgv("system", "env", null, true);
    console.log(JSON.stringify(params));
    let res = _callSync(JSON.stringify(params));
    return JSON.parse(res);
  },
};
