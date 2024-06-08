//
//  ContainerView.swift
//  CutCalc
//
//  Created by Zach Eidenberger on 6/8/24.
//

import SwiftUI

struct ContainerView: View {
    @ObservedObject var container: ContainerModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ForEach(container.rectangles) { rect in
                BoardView(rectangle: rect)
            }
        }
        .frame(width: container.width, height: container.height)
        .border(Color.black, width: 2)
    }
}


#Preview {
    ContainerView(container: ContainerModel(width: 48, height: 96))
}
