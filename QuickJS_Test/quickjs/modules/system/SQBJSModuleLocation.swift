//
//  SQBJSModuleLocation.swift
//  QuickJS_Test
//
//  Created by zhangjianming on 2023/7/20.
//

import Foundation

class SQBJSModuleLocation: NSObject, SQBJSModule {
    static func moduleName() -> String! {
        return "location"
    }

    static func syncCharacters() -> [String : SQBJSCharacterSync.Type]! {
        return [:]
    }

    static func asyncCharacters() -> [String : SQBJSCharacterAsync.Type]! {
        return [
            "position": SQBJSCharacterPositionAsync.self
        ]
    }
}
