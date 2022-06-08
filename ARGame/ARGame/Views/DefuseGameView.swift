//
//  ContentView.swift
//  ARGame
//
//  Created by Rebecca Mello on 01/06/22.
//

import SwiftUI

struct DefuseGameView: View {
    @State var showButton: Bool = false
    var gameDataViewModel: GameDataViewModel
    
    var body: some View {
        VStack {
            ARViewContainer(showButton: $showButton, isPlanting: false, gameDataViewModel: gameDataViewModel)
                .edgesIgnoringSafeArea(.all)
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
