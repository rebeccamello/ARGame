//
//  ContentView.swift
//  ARGame
//
//  Created by Rebecca Mello on 01/06/22.
//

import SwiftUI

struct DefuseGameView: View {
    var gameDataViewModel: GameDataViewModel
    @State var showButton: Bool = false
    @State var gameOver: Bool = false
    @Binding var selectedMinute: Int
    
    var body: some View {
        if !gameOver {
            ZStack {
                ARViewContainer(showButton: $showButton, isPlanting: false, gameDataViewModel: gameDataViewModel)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    TimerStruct(initialTime: TimeInterval(selectedMinute * 60))
                    
                    Spacer()
                    
                    ConditionalButton(showButton: $showButton, text: "DESARMAR!", backgroundColor: .accentColor, foregroundColor: Color("BackgroundColor")) {
                        gameOver = true
                    }
                }
            }
        } else {
            GameOverView(titleText: "DEU BOM", text: "BOA KRL", time: "")
        }
    }
}

#if DEBUG
//struct ARViewContainer_Previews: PreviewProvider {
//    static var previews: some View {
//        DefuseGameView()
//    }
//}
#endif
