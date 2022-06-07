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
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(showButton: $showButton, isPlanting: true)
                .edgesIgnoringSafeArea(.all)
            
            ConditionalButton(showButton: $showButton, text: "PLANTAR BOMBA", backgroundColor: .accentColor, foregroundColor: Color("BackgroundColor")) {
                showingTimer = true
            }
        }
        .fullScreenCover(isPresented: $showingTimer) {
            DefuseGameView()
        } content: {
            TimerView()
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

struct SetBombView_Previews: PreviewProvider {
    static var previews: some View {
        SetBombView()
    }
}
