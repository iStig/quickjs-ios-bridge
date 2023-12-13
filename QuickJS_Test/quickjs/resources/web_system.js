"use strict";

WOSAI.web = {
    /**
     * get SQB runtime env by sync function
     * @returns {object} object of envs {code, message, data}
     */
    //    callSync: () => {
    //        let params = _genCallArgv("web", "callSync", {module:'aaa',method:'bbb',params:{cccc:'dddd'}}, true);
    //        let res = _callSync(JSON.stringify(params));
    //        return JSON.parse(res);
    //    },

    //callSync: (param) => {
    //    console.log('2222' + JSON.stringify(param));
    //    let params = _genCallArgv("web", "callSync", param, true);
    //    console.log('3333' + JSON.stringify(params));
    //    let res = _callSync(JSON.stringify(params));
    //    console.log('4444' + JSON.parse(res));
    //    return JSON.parse(res);
    //},

    callSync(param) {
        console.log('>>>WOSAI.web.callSync: ' + JSON.stringify(param));
        const params = _genCallArgv("web", "callSync", param, true);
        console.log('>>>WOSAI.web.callSync_genCallArgv: ' + JSON.stringify(params));
        const res = _callSync(JSON.stringify(params));
        console.log('>>>WOSAI.web.callSync_callSync: ' + JSON.stringify(params));
        return JSON.parse(res);
    },

    callAsync: (callback) => {
        console.log('>>>WOSAI.web.callAsync: ' + callback);
        let params = _genCallArgv("web", "callAsync", { module: 'aaa', method: 'bbb', params: { cccc: 'dddd' } }, false, callback);//生成参数
        console.log('>>>WOSAI.web.callAsync_genCallArgv: ' + JSON.stringify(param));
        let res = _call(JSON.stringify(params));
        console.log('>>>WOSAI.web.callAsync_call: ' + callback);
        callback(JSON.parse(res));
    },
    
    callAsync: (param, callback) => {
        console.log('>>>WOSAI.web.callAsyncWithParam: ' + callback);
        let params = _genCallArgv("web", "callAsync", param, false, callback);//生成参数
        console.log('>>>WOSAI.web.callAsyncWithParam_genCallArgv: ' + JSON.stringify(param));
        let res = _call(JSON.stringify(params));
        console.log('>>>WOSAI.web.callAsyncWithParam_call: ' + res);
        callback(JSON.parse(res));
    }
};


