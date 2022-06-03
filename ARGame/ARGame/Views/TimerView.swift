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
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea(.all)
            
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
                
                CustomButtons(text: "Começar", backgroundColor: Color("BlueColor"), foregroundColor: Color("BackgroundColor"), action: {
                    print("vai")
                })
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
