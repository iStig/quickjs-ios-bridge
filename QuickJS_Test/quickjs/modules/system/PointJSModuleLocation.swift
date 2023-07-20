//
//  PointJSModuleLocation.swift
//  QuickJS_Test
//
//  Created by zhangjianming on 2023/7/20.
//

import Foundation

class PointJSModuleLocation: NSObject, PointJSModule {
    static func moduleName() -> String! {
        return "location"
    }

    static func syncCharacters() -> [String : PointJSCharacterSync.Type]! {
        return [:]
    }

    static func asyncCharacters() -> [String : PointJSCharacterAsync.Type]! {
        return [
            "position": PointJSCharacterPositionAsync.self
        ]
    }
}
