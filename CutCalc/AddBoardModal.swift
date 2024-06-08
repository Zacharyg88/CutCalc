//
//  AddBoardModal.swift
//  CutCalc
//
//  Created by Zach Eidenberger on 6/7/24.
//

import SwiftUI

struct AddBoardModal: View {
    @State var board: BoardModel = BoardModel(name: "", length: "0.00", width: "0.00", thickness: "0.00")
    var body: some View {
        VStack {
            HStack {
                Text("Name:")
                Spacer()
                TextField("Name", text: $board.name)
                    .multilineTextAlignment(.trailing)
                    .textFieldStyle(.roundedBorder)


            }
            HStack {
                Text("Length:")
                Spacer()
                TextField("Length", text: $board.name)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    
            }
            HStack {
                Text("Width:")
                Spacer()
                TextField("Width", text: $board.name)
                    .multilineTextAlignment(.trailing)
                    .textFieldStyle(.roundedBorder)


            }
            HStack {
                Text("Thickness:")
                Spacer()
                TextField("Thickness", text: $board.name)
                    .multilineTextAlignment(.trailing)
                    .textFieldStyle(.roundedBorder)


            }
        }
    }
}

#Preview {
    AddBoardModal()
}
