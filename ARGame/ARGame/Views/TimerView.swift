//
//  TimerBiew.swift
//  ARGame
//
//  Created by Rebecca Mello on 03/06/22.
//

import SwiftUI

struct TimerView: View {
    
    @State var timerMode: TimerMode = .init()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea(.all)
            
            VStack {
                Text("Objeto escolhido!")
                    .foregroundColor(Color("TextColor"))
                    .font(.system(size: 30, design: .default))
                    .padding()
                
                Spacer()
                
                Text("Tempo para encontrar")
                    .foregroundColor(Color("TextColor"))
                    .font(.system(size: 15, design: .default))
                    .padding()
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct TimerBiew_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
