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
    
    
    var body: some View {
        ZStack (alignment: .bottom){
            ARViewContainer(showButton: $showButton, isPlanting: false)
                .edgesIgnoringSafeArea(.all)
            
            TimerStruct()
        }
    }
}

struct TimerStruct: View {
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(vm.time)")
                .font(.system(size: 30))
            
            Button("Start") {
                vm.start(minutes: vm.minutes)
            }
            .disabled(vm.isActive)
        }
        .onReceive(timer) { _ in
            vm.updateCountdown()
        }
    }
}

#if DEBUG
struct ARViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        DefuseGameView()
    }
}
#endif
