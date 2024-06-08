//
//  BoardLayoutView.swift
//  CutCalc
//
//  Created by Zach Eidenberger on 6/8/24.
//

import SwiftUI

struct BoardLayoutView: View {
    @StateObject var container = ContainerModel(width: 300, height: 300)

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
                RectangleModel(width: 70, height: 50),
                RectangleModel(width: 100, height: 80),
                RectangleModel(width: 60, height: 60),
                RectangleModel(width: 50, height: 50)
            ]
        }
    }
}


#Preview {
    BoardLayoutView()
}
