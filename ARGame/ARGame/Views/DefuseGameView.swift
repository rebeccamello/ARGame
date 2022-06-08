//
//  ContentView.swift
//  ARGame
//
//  Created by Rebecca Mello on 01/06/22.
//

import SwiftUI

struct DefuseGameView: View {
    @State var showButton: Bool = false
    @Binding var selectedMinute: Int
    var gameDataViewModel: GameDataViewModel
    
    var body: some View {
        VStack {
            ARViewContainer(showButton: $showButton, isPlanting: false, gameDataViewModel: gameDataViewModel)
                .edgesIgnoringSafeArea(.all)
            
            TimerStruct(initialTime: TimeInterval(selectedMinute * 60))
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

struct TimerStruct: View {
    @ObservedObject private var viewModel: TimerViewModel
    
    init(initialTime: TimeInterval) {
        self.viewModel = TimerViewModel(initialTime: initialTime)
    }
    
    var body: some View {
        if !viewModel.timeEnded {
            VStack {
                Text("\(viewModel.formatedTime)")
                    .font(.system(size: 30, weight: .bold, design: .monospaced))
                    .padding()
            }
            .onReceive(viewModel.timer, perform: viewModel.update)
        } else {
            GameOverView(titleText: "Que pena!", text: "Você não conseguiu desarmar a  bomba antes do tempo!", time: "00:00")
        }
    }
}
