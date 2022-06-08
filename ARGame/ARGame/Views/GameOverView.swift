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
    var imageName: String
    var time: String
    @State private var goToMenu: Bool = false
    @State private var playAgain: Bool = false
    
    var body: some View {
        
        if !goToMenu && !playAgain{
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
                    
                    Image(imageName)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.35)
                        .scaledToFit()
                        .padding()
                    
                    CustomButtons(text: "Jogar novamente", backgroundColor: Color("AccentColor"), foregroundColor: Color("BackgroundColor"), action: {
                        print("vai de novo")
                        playAgain = true
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
        }
        
        else if !goToMenu && playAgain {
            SetBombView()
        }
        
        else {
            MenuView()
        }
    }
}
