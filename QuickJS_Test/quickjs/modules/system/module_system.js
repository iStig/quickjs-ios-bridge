"use strict";

WOSAI.system = {
    /**
     * get SQB runtime env by sync function
     * @returns {object} object of envs {code, message, data}
     */
    env: () => {
        console.log('>>>WOSAI.system.env');
        let params = _genCallArgv("system", "env", null, true);
        console.log('>>>WOSAI.system.env_genCallArgv: ' +  JSON.stringify(params));
        let res = _callSync(JSON.stringify(params));
        console.log('>>>WOSAI.system.env_callSync: ' +  res);
        return JSON.parse(res);
    },
};


WOSAI.location = {
    position: (callback) => {
        console.log('>>>WOSAI.location.position: ' + callback);
        let params = _genCallArgv("location", "position", { a: 1 }, false, callback);//生成参数
        console.log('>>>WOSAI.location.position_genCallArgv: ' +  JSON.stringify(param));
        let res = _call(JSON.stringify(params));
        console.log('>>>WOSAI.location.position_call: ' +  res);
        callback(JSON.parse(res));
    }
};




//function sendNotification() {
//    WosaiJSBridge.call('sSendNotification', {
//        eventName: 'liveactivity', data: {
//            bizChannel = 'abcd',
//            bizId = 2,
//            callStartTime = 1689158523176,
//            extra =     {
//                taskId = 1663323742000;//任务id
//                hours = 1;//业务数据
//                money = '323.21';//业务数据
//                type = 3;//业务数据
//            }
//        }
//    }, function (result) {
//        alert(JSON.stringify(result));
//    }, true);
//}
//
//
//
//
//WosaiJSBridge.sendNotification('liveactivity', {
//    bizChannel = 'abcd',
//    bizId = 2,
//    callStartTime = 1689158523176,   
//    extra = {
//        taskId = 1663323742000,//任务id
//        hours = 1,//业务数据
//        money = '323.21',//业务数据
//        type = 3,//业务数据
//    }
//}, function (result) {
//    alert(JSON.stringify(result));
//});
