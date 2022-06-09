//
//  TimerStruct.swift
//  ARGame
//
//  Created by Vitor Grechi Kuninari on 08/06/2022.
//

import SwiftUI

struct TimerStruct: View {
    @ObservedObject private var viewModel: TimerViewModel
    
    init(initialTime: TimeInterval) {
        self.viewModel = TimerViewModel(initialTime: initialTime)
    }
    
    var body: some View {
        VStack {
            Text("\(viewModel.formatedTime)")
                .font(.system(size: 30, weight: .bold, design: .monospaced))
                .padding()
        }
        .onReceive(viewModel.timer, perform: viewModel.update)
        .background(
            NavigationLink(isActive: $viewModel.timeEnded, destination: {
                GameOverView(titleText: "Que pena!", text: "Você não conseguiu desarmar a  bomba antes do tempo!", imageName: "explodedBomb", time: "00:00")
            }, label: {
                EmptyView()
            })
        )
    }
}
