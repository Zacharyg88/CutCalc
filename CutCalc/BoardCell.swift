//
//  BoardCell.swift
//  CutCalc
//
//  Created by Zach Eidenberger on 6/7/24.
//

import SwiftUI

struct BoardCell: View {
    @State var board: BoardModel?
    var body: some View {
        VStack {
            Text(board?.name ?? "Title")
            HStack {
                Text("length:")
                Spacer()
                Text(board?.length ?? "")
            }
            HStack {
                Text("width:")
                Spacer()
                Text(board?.width ?? "")
            }
            HStack {
                Text("thickness:")
                Spacer()
                Text(board?.thickness ?? "")
            }
            
        }
    }
}

#Preview {
    BoardCell()
}
