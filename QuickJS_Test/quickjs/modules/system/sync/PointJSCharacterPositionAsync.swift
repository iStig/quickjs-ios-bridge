//
//  PointJSCharacterPositionAsync.swift
//  QuickJS_Test
//
//  Created by zhangjianming on 2023/7/20.
//

import Foundation

class PointJSCharacterPositionAsync: NSObject, PointJSCharacterAsync {
    
    func characterName() -> String! {
        return "position"
    }
    
    func characterType() -> PointJSCallType {
        return .async
    }
    
    //    func jsResponse(_ context: QJSContext!, with argv: PointJSCallArgv!) -> PointJSResponse! {
    //        let dict = [
    //            "latitude": "24.212613",
    //            "longitude": "113.155986"
    //        ]
    //        return .ok(dict as NSObject)
    //    }
    
    func jsResponse(_ context: QJSContext!, with argv: PointJSCallArgv!, callback cb: ((PointJSResponse?) -> Void)!) {
        
        let dict = [
            "latitude": "24.212613",
            "longitude": "113.155986"
        ]
        
        
        let delayTime = DispatchTime.now() + DispatchTimeInterval.seconds(3)
        DispatchQueue.global().asyncAfter(deadline: delayTime) {
            print(dict,argv,context);
            DispatchQueue.main.sync {//主线程
                cb(.ok(dict as NSObject));
            }
        }
    }
}
