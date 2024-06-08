//
//  BoardView.swift
//  CutCalc
//
//  Created by Zach Eidenberger on 6/8/24.
//

import SwiftUI

struct BoardView: View {
    @ObservedObject var rectangle: RectangleModel
    
    var body: some View {
        Rectangle()
            .stroke(Color.blue, lineWidth: 2)
            .background(Color.blue.opacity(0.3))
            .frame(width: rectangle.width, height: rectangle.height)
            .position(x: rectangle.x + rectangle.width / 2, y: rectangle.y + rectangle.height / 2)
    }
}

#Preview {
    BoardView(rectangle: RectangleModel(width: 14.25, height: 16))
}
