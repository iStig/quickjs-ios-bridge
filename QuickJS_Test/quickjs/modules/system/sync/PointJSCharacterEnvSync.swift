//
//  PointJSCharacterEnvSync.swift
//  Point
//
//  Created by matrixme on 2023/7/18.
//

import Foundation

class PointJSCharacterEnvSync: NSObject, PointJSCharacterSync {
    
    func characterName() -> String! {
        return "env"
    }
    
    func characterType() -> PointJSCallType {
        return .sync
    }
    
    func jsResponse(_ context: QJSContext!, with argv: PointJSCallArgv!) -> PointJSResponse! {
        let dict = [
            "width": UIScreen.main.bounds.width,
            "height": UIScreen.main.bounds.height
        ]
        return .ok(dict as NSObject)
    }
}
