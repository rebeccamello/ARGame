//
//  GameOverView.swift
//  ARGame
//
//  Created by Rebecca Mello on 02/06/22.
//

import SwiftUI

struct GameOverView: View {
    var titleText: String
    var text: String
    var time: String
    @State private var goToMenu: Bool = false
    
    var body: some View {
        
        if !goToMenu {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    Text(titleText)
                        .foregroundColor(Color("ForegroundColor"))
                        .font(.system(size: 54))
                        .bold()
                        .padding()
                    
                    Text(text)
                        .foregroundColor(Color("ForegroundColor"))
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text(time)
                        .foregroundColor(Color("ForegroundColor"))
                        .font(.title3)
                        .padding()
                    
                    Image("bomba1")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaledToFit()
                        .padding()
                    
                    CustomButtons(text: "Jogar novamente", backgroundColor: Color("AccentColor"), foregroundColor: Color("BackgroundColor"), action: {
                        print("vai de novo")
                    })
                    
                    Button("Menu") {
                        goToMenu = true
                    }
                    .frame(width: 200, height: 44)
                    .background(Color("BackgroundColor"))
                    .foregroundColor(Color("AccentColor"))
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: Color("AccentColor"), radius: 8)
                }
            }
            .preferredColorScheme(.dark)
        } else {
            MenuView()
        }
    }
}

#if DEBUG
struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(titleText: "Parabens!", text: "Você conseguiu desarmar a bomba antes do tempo!", time: "05:00")
    }
}
#endif
