//
//  SQBJSCharacterEnvSync.swift
//  SQB
//
//  Created by matrixme on 2023/7/18.
//

import Foundation

class SQBJSCharacterEnvSync: NSObject, SQBJSCharacterSync {
    
    func characterName() -> String! {
        return "env"
    }
    
    func characterType() -> SQBJSCallType {
        return .sync
    }
    
    func jsResponse(_ context: QJSContext!, with argv: SQBJSCallArgv!) -> SQBJSResponse! {
        let dict = [
            "width": UIScreen.main.bounds.width,
            "height": UIScreen.main.bounds.height
        ]
        print("***nativelog***SQBJSCharacterEnvSync_main",dict);
        return .ok(dict as NSObject)
    }
}
