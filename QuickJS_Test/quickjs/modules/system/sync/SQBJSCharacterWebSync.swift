//
//  SQBJSCharacterWebSync.swift
//  QuickJS_Test
//
//  Created by zhangjianming on 2023/7/31.
//

import Foundation

class SQBJSCharacterWebSync: NSObject, SQBJSCharacterSync {
    
    func characterName() -> String! {
        return "web"
    }
    
    func characterType() -> SQBJSCallType {
        return .sync
    }
    
    func jsResponse(_ context: QJSContext!, with argv: SQBJSCallArgv!) -> SQBJSResponse! {
        let dict = [
            "width": UIScreen.main.bounds.width,
            "height": UIScreen.main.bounds.height
        ]
        return .ok(dict as NSObject)
    }
}
