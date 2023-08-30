//
//  SQBJSCharacterWebAsync.swift
//  QuickJS_Test
//
//  Created by zhangjianming on 2023/7/31.
//

import Foundation


class SQBJSCharacterWebAsync: NSObject, SQBJSCharacterAsync {
    
    func characterName() -> String! {
        return "web"
    }
    
    func characterType() -> SQBJSCallType {
        return .async
    }
    
    func jsResponse(_ context: QJSContext!, with argv: SQBJSCallArgv!, callback cb: ((SQBJSResponse?) -> Void)!) {
        print(argv.params);
        let dict = [
            "latitude": "24.212613",
            "longitude": "113.155986"
        ]
        
        let delayTime = DispatchTime.now() + DispatchTimeInterval.seconds(3)
        DispatchQueue.global().asyncAfter(deadline: delayTime) {
//            print(dict,argv,context);
//            print("aaa");
            DispatchQueue.main.sync {//主线程
                print("aaa");
                cb(.ok(dict as NSObject));
            }
        }
        
//        print("bbb");
//        sleep(3);
//        print("aaa111");
//        cb(.ok(dict as NSObject));
    }
}
