//
//  SetBombView.swift
//  ARGame
//
//  Created by Rebecca Mello on 07/06/22.
//

import SwiftUI

struct SetBombView: View {
    @State var showButton: Bool = false
    @State var showingTimer: Bool = false
    var gameDataViewModel: GameDataViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(showButton: $showButton, isPlanting: true, gameDataViewModel: gameDataViewModel)
                .edgesIgnoringSafeArea(.all)
            
            ConditionalButton(showButton: $showButton, text: "PLANTAR BOMBA", backgroundColor: .accentColor, foregroundColor: Color("BackgroundColor")) {
                showingTimer = true
                
            }
        }
        .fullScreenCover(isPresented: $showingTimer) {
            DefuseGameView(gameDataViewModel: gameDataViewModel)
        } content: {
            TimerView(gameDataViewModel: gameDataViewModel)
        }
    }
}

struct ConditionalButton: View {
    @Binding var showButton: Bool
    let text: String
    let backgroundColor: Color
    let foregroundColor: Color
    let action: () -> Void
    
    var body: some View {
        if showButton {
            CustomButtons(text: text, backgroundColor: backgroundColor, foregroundColor: foregroundColor, action: action)
        } else {
            EmptyView()
        }
    }
}

//struct SetBombView_Previews: PreviewProvider {
//    static var previews: some View {
//        SetBombView()
//    }
//}
