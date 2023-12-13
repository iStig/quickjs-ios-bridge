//
//  SQBJSCharacterPositionAsync.swift
//  QuickJS_Test
//
//  Created by zhangjianming on 2023/7/20.
//

import Foundation

class SQBJSCharacterPositionAsync: NSObject, SQBJSCharacterAsync {
    
    func characterName() -> String! {
        return "position"
    }
    
    func characterType() -> SQBJSCallType {
        return .async
    }
    
    //    func jsResponse(_ context: QJSContext!, with argv: SQBJSCallArgv!) -> SQBJSResponse! {
    //        let dict = [
    //            "latitude": "24.212613",
    //            "longitude": "113.155986"
    //        ]
    //        return .ok(dict as NSObject)
    //    }
    
    func jsResponse(_ context: QJSContext!, with argv: SQBJSCallArgv!, callback cb: ((SQBJSResponse?) -> Void)!) {
        
        let dict = [
            "latitude": "24.212613",
            "longitude": "113.155986"
        ]
        
        let delayTime = DispatchTime.now() + DispatchTimeInterval.seconds(3)
        DispatchQueue.global().asyncAfter(deadline: delayTime) {
            print("***nativelog***SQBJSCharacterPositionAsync_asyncAfter",dict);
            DispatchQueue.main.sync {//主线程
                print("***nativelog***SQBJSCharacterPositionAsync_main.sync",dict);
                cb(.ok(dict as NSObject));
            }
        }
    }
}
