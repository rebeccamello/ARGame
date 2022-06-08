//
//  ContentView.swift
//  ARGame
//
//  Created by Rebecca Mello on 01/06/22.
//

import SwiftUI

enum ImageNames: String {
    case tia = "TIA"
    case bu = "BU"
}

struct DefuseGameView: View {
    @State var showButton: Bool = false
    @Binding var selectedMinute: Int
    
    var body: some View {
        ZStack (alignment: .bottom){
            ARViewContainer(showButton: $showButton, isPlanting: false)
                .edgesIgnoringSafeArea(.all)
            
            TimerStruct(viewModel: TimerStruct.ViewModel(min: selectedMinute))
        }
    }
}

struct TimerStruct: View {
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @ObservedObject private var vm: ViewModel
    
    init(viewModel: ViewModel) {
        self.vm = viewModel
    }
    
    var body: some View {
        if !vm.showingAlert {
            VStack {
                Text("\(vm.time)")
                    .font(.system(size: 30))
                
                Button("Começar") {
                    vm.start(minutes: vm.minutes)
                }
                .disabled(vm.isActive)
            }
            .onReceive(timer) { _ in
                vm.updateCountdown()
            }
        } else {
            GameOverView(titleText: "Que pena!", text: "Você não conseguiu desarmar a  bomba antes do tempo!", time: "00:00")
        }
        
    }
}

//#if DEBUG
//struct ARViewContainer_Previews: PreviewProvider {
//    static var previews: some View {
//        DefuseGameView()
//    }
//}
//#endif
