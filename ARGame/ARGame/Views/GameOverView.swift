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
    var imageName: String
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                Text(titleText)
                    .foregroundColor(Color("ForegroundColor"))
                    .font(.custom("DESIGNER", size: 60))
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
                    .frame(width: UIScreen.main.bounds.width * 0.65, height: UIScreen.main.bounds.height * 0.27)
                    .scaledToFit()
                    .padding()
                
                CustomButtons(text: "Jogar novamente", backgroundColor: Color("AccentColor"), foregroundColor: Color("BackgroundColor"), action: {
                    print("vai de novo")
                })
                
                Button("Menu") {
                
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
}

#if DEBUG
struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(titleText: "Parabens!", text: "Você conseguiu desarmar a bomba antes do tempo!", time: "05:00", imageName: "bomba1")
    }
}
#endif
