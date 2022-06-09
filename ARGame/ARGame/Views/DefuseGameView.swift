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
        }.background(
            NavigationLink(isActive: $gameOver, destination: {
                GameOverView(titleText: "PARABÉNS!", text: "Você conseguiu desarmar a  bomba antes do tempo!", imageName: "bomba1", time: "")
            }, label: {
                EmptyView()
            })
        )

//        if !gameOver {
//                    } else {
//            GameOverView(titleText: "PARABÉNS!", text: "Você conseguiu desarmar a  bomba antes do tempo!", imageName: "bomba1", time: "")
//        }
    }
}
