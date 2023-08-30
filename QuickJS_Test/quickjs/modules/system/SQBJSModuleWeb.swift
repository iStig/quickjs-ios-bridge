//
//  SQBJSModuleWeb.swift
//  QuickJS_Test
//
//  Created by zhangjianming on 2023/7/31.
//

import Foundation

class SQBJSModuleWeb: NSObject, SQBJSModule {
    static func moduleName() -> String! {
        return "web"
    }

    static func syncCharacters() -> [String : SQBJSCharacterSync.Type]! {
        return [
            "callSync": SQBJSCharacterWebSync.self
        ]
    }

    static func asyncCharacters() -> [String : SQBJSCharacterAsync.Type]! {
        return [
            "callAsync": SQBJSCharacterWebAsync.self
        ]
    }
}
