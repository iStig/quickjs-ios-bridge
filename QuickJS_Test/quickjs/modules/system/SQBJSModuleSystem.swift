//
//  SQBJSModuleSystem.swift
//  SQB
//
//  Created by matrixme on 2023/7/18.
//

import Foundation

class SQBJSModuleSystem: NSObject, SQBJSModule {
    static func moduleName() -> String! {
        return "system"
    }

    static func syncCharacters() -> [String : SQBJSCharacterSync.Type]! {
        return [
            "env": SQBJSCharacterEnvSync.self
        ]
    }

    static func asyncCharacters() -> [String : SQBJSCharacterAsync.Type]! {
        return [:]
    }
}
