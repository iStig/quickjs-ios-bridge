//
//  PointJSContainer.swift
//  Point
//
//  Created by matrixme on 2023/7/18.
//

import Foundation

extension PointJSContainer {
    @discardableResult
    func eval(_ jsFile: String, params: [AnyHashable: Any]) -> QJSValue {
        let js = (try? String(contentsOf: Bundle.main.url(forResource: jsFile, withExtension: "js")!)) ?? ""
        return eval(js, params)
    }
}
