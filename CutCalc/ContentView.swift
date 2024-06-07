//
//  ContentView.swift
//  CutCalc
//
//  Created by Zach Eidenberger on 6/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var boards: [BoardModel] = []
    @State var showingAddBoardModal: Bool = false
    var body: some View {
        VStack {
            List(boards) { board in
                BoardCell(board: board)
            }
            Button(action: {
                self.showingAddBoardModal.toggle()
            }, label: {
                Image(systemName: "plus.app.fill")
            })
            .sheet(isPresented: $showingAddBoardModal, content: {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Sheet Content")/*@END_MENU_TOKEN@*/
            })
        }
    }
}

#Preview {
    ContentView()
}
