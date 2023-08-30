"use strict";

WOSAI.system = {
    /**
     * get SQB runtime env by sync function
     * @returns {object} object of envs {code, message, data}
     */
    env: () => {
        let params = _genCallArgv("system", "env", null, true);
        let res = _callSync(JSON.stringify(params));
        return JSON.parse(res);
    },
};


WOSAI.location = {
    position: (callback) => {
        let params = _genCallArgv("location", "position", { a: 1 }, false, callback);//生成参数
//                console.log('3333'+ params);
        //        console.log('4444'+ JSON.stringify(params));
        let res = _call(JSON.stringify(params));
        //        console.log('5555'+ JSON.stringify(res));
        //        console.log('6666'+ res);
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
