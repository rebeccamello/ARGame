//
//  TimerBiew.swift
//  ARGame
//
//  Created by Rebecca Mello on 03/06/22.
//

import SwiftUI

struct TimerView: View {
    
    @State var selectedMinute = 0
    let availableMinutes = Array(1...60)
    @State private var showingGame = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea(.all)
            
            if !showingGame {
                VStack (alignment: .center) {
                    Text("Objeto escolhido!")
                        .foregroundColor(Color("ForegroundColor"))
                        .font(.system(size: 30, design: .default))
                        .padding()
                    
                    Text("Tempo para encontrar")
                        .foregroundColor(Color("ForegroundColor"))
                        .font(.system(size: 15, design: .default))
                        .padding()
                    
                    Picker("", selection: $selectedMinute){
                        ForEach(0 ..< availableMinutes.count, id: \.self) { i in
                            Text("\(i) min").tag(i)
                        }
                    }
                    .frame(width: 10)
                    .pickerStyle(.inline)
                    
                    HStack {
                        Button("Voltar") {
                            print("voltar")
                        }
                        .frame(width: 150, height: 44)
                        .background(Color("BackgroundColor"))
                        .foregroundColor(Color("BlueColor"))
                        .cornerRadius(10)
                        .padding()
                        .shadow(color: Color("AccentColor"), radius: 8)
                        
                        Button("Começar") {
                            showingGame.toggle()
                        }
                        .frame(width: 150, height: 44)
                        .background(Color("BlueColor"))
                        .foregroundColor(Color("BackgroundColor"))
                        .cornerRadius(10)
                        .padding()
                    }
                    .padding()
                }
            } else {
                Player2GameView()
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
