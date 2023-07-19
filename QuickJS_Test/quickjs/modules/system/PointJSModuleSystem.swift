//
//  PointJSModuleSystem.swift
//  Point
//
//  Created by matrixme on 2023/7/18.
//

import Foundation

class PointJSModuleSystem: NSObject, PointJSModule {
    static func moduleName() -> String! {
        return "system"
    }

    static func syncCharacters() -> [String : PointJSCharacterSync.Type]! {
        return [
            "env": PointJSCharacterEnvSync.self
        ]
    }

    static func asyncCharacters() -> [String : PointJSCharacterAsync.Type]! {
        return [:]
    }
}
