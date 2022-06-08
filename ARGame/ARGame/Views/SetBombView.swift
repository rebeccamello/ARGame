//
//  SetBombView.swift
//  ARGame
//
//  Created by Rebecca Mello on 07/06/22.
//

import SwiftUI

struct SetBombView: View {
    var gameDataViewModel: GameDataViewModel

    @State var showButton: Bool = false
    @State var showingTimer: Bool = false
    @State var selectedMinute: Int = 1
    @State var defuse: Bool = false
    
    var body: some View {
        if !defuse {
            ZStack(alignment: .bottom) {
                ARViewContainer(showButton: $showButton, isPlanting: true, gameDataViewModel: gameDataViewModel)
                    .edgesIgnoringSafeArea(.all)
                
                ConditionalButton(showButton: $showButton, text: "PLANTAR!", backgroundColor: .accentColor, foregroundColor: Color("BackgroundColor")) {
                    showingTimer = true
                }
            }
            .fullScreenCover(isPresented: $showingTimer) {
                TimerView(gameDataViewModel: gameDataViewModel, selectedMinute: $selectedMinute, showingTimer: $showingTimer, defuse: $defuse)
            }
        } else {
            DefuseGameView(gameDataViewModel: gameDataViewModel, selectedMinute: $selectedMinute)
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

#if DEBUG
//struct SetBombView_Previews: PreviewProvider {
//    static var previews: some View {
//        SetBombView()
//    }
//}
#endif
