//
//  BoardLayoutView.swift
//  CutCalc
//
//  Created by Zach Eidenberger on 6/8/24.
//

import SwiftUI

struct BoardLayoutView: View {
    @StateObject var container = ContainerModel(width: 49, height: 96)

    var body: some View {
        VStack {
            ContainerView(container: container)
            Button("Pack Rectangles") {
                packRectangles(container: container)
            }
            .padding()
        }
        .onAppear {
            // Initialize rectangles
            container.rectangles = [
                RectangleModel(width: 10, height: 12),
                RectangleModel(width: 8, height: 9),
                RectangleModel(width: 12, height: 3),
                RectangleModel(width: 19, height: 14)
            ]
        }
    }
}


#Preview {
    BoardLayoutView()
}
