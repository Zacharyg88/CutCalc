//
//  BoardModel.swift
//  CutCalc
//
//  Created by Zach Eidenberger on 6/7/24.
//

import Foundation

struct BoardModel: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var length: String
    var width: String
    var thickness: String
    
    func convertStringToFloat(value: String) -> Float? {
        let components = value.components(separatedBy: " ")
        var measurement: Float = 0.0
        guard let baseNumber = Float(components[0]) else { return nil }
        measurement = baseNumber
        for i in components {
            if i.localizedStandardContains("/") {
                let subcomponents = i.components(separatedBy: "/")
                guard let top = Float(subcomponents[0]) else { break }
                guard let bottom = Float(subcomponents[1]) else { break }
                var fraction = top / bottom
                measurement += fraction
            }
        }
        return measurement
    }
}
