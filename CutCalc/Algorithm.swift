//
//  Algorithm.swift
//  CutCalc
//
//  Created by Zach Eidenberger on 6/7/24.
//

import Foundation
import SwiftUI

class RectangleModel: ObservableObject, Identifiable {
    var id = UUID()
    @Published var width: Double
    @Published var height: Double
    @Published var x: Double = 0
    @Published var y: Double = 0
    @Published var rotated: Bool = false

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    func rotate() {
        swap(&width, &height)
        rotated = !rotated
    }
}

class ContainerModel: ObservableObject {
    @Published var width: Double
    @Published var height: Double
    @Published var rectangles: [RectangleModel] = []

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}




func canPlace(rect: RectangleModel, in container: ContainerModel, at x: Double, y: Double, rotated: Bool = false) -> Bool {
    let originalWidth = rect.width
    let originalHeight = rect.height

    if rotated {
        rect.rotate()
    }
    defer {
        if rotated {
            rect.width = originalWidth
            rect.height = originalHeight
        }
    }

    if x + rect.width > container.width || y + rect.height > container.height {
        return false
    }

    for otherRect in container.rectangles where rect.id != otherRect.id {
        if x < otherRect.x + otherRect.width &&
            x + rect.width > otherRect.x &&
            y < otherRect.y + otherRect.height &&
            y + rect.height > otherRect.y {
            return false
        }
    }

    return true
}



//func placeRectangle(_ rect: RectangleModel, in container: ContainerModel) -> Bool {
//    for y in stride(from: 0.0, to: container.height, by: 1.0) {
//        for x in stride(from: 0.0, to: container.width, by: 1.0) {
//            if canPlace(rect: rect, in: container, at: x, y: y) {
//                rect.x = x
//                rect.y = y
//                for i in stride(from: 0.0, to: rect.width, by: 1.0) {
//                    for j in stride(from: 0.0, to: rect.height, by: 1.0) {
//                        container.occupied[Int(y + j)][Int(x + i)] = true
//                    }
//                }
//                return true
//            }
//            if canPlace(rect: rect, in: container, at: x, y: y, rotated: true) {
//                rect.rotate()
//                rect.x = x
//                rect.y = y
//                for i in stride(from: 0.0, to: rect.width, by: 1.0) {
//                    for j in stride(from: 0.0, to: rect.height, by: 1.0) {
//                        container.occupied[Int(y + j)][Int(x + i)] = true
//                    }
//                }
//                return true
//            }
//        }
//    }
//    return false
//}

func bestFitPlaceRectangle(_ rect: RectangleModel, in container: ContainerModel) -> Bool {
    var bestX: Double = -1
    var bestY: Double = -1
    var minGap = Double.greatestFiniteMagnitude

    for y in stride(from: 0.0, through: container.height - rect.height, by: 1.0) {
        for x in stride(from: 0.0, through: container.width - rect.width, by: 1.0) {
            if canPlace(rect: rect, in: container, at: x, y: y) {
                let gap = (container.width - (x + rect.width)) + (container.height - (y + rect.height))
                if gap < minGap {
                    bestX = x
                    bestY = y
                    minGap = gap
                }
            }
            if canPlace(rect: rect, in: container, at: x, y: y, rotated: true) {
                let gap = (container.width - (x + rect.height)) + (container.height - (y + rect.width))
                if gap < minGap {
                    rect.rotate()
                    bestX = x
                    bestY = y
                    minGap = gap
                }
                rect.rotate() // Rotate back to original for next iteration
            }
        }
    }

    if bestX != -1 {
        rect.x = bestX
        rect.y = bestY
        return true
    }
    return false
}




func packRectangles(container: ContainerModel) {
    let sortedRectangles = container.rectangles.sorted { $0.height * $0.width > $1.height * $1.width }

    for rect in sortedRectangles {
        if !bestFitPlaceRectangle(rect, in: container) {
            print("Could not place rectangle of size \(rect.width)x\(rect.height)")
        }
    }
}


