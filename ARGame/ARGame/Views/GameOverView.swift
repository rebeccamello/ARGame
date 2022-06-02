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
            Color("BackgroundColor").ignoresSafeArea()
            VStack {
                Text(titleText)
                    .foregroundColor(Color("BlueColor"))
                    .font(.system(size: 54))
                    .bold()
                    .padding()
                
                Text(text)
                    .foregroundColor(Color("TextColor"))
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text(time)
                    .foregroundColor(Color("TextColor"))
                    .font(.title3)
                    .padding()
                
                Image(imageName)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaledToFit()
                    .padding()
                
                CustomButtons(text: "Jogar novamente", backgroundColor: Color("BlueColor"), foregroundColor: Color("BackgroundColor"), action: {
                    print("vai de novo")
                })
                
                Button("Menu") {
                
                }
                .frame(width: 200, height: 44)
                .background(Color("BackgroundColor"))
                .foregroundColor(Color("BlueColor"))
                .cornerRadius(10)
                .padding()
                .shadow(color: Color("BlueColor"), radius: 8)
            }
                
        }
        .preferredColorScheme(.dark)
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(titleText: "Parabens!", text: "Você conseguiu desarmar a bomba antes do tempo!", time: "05:00", imageName: "bomba1")
    }
}
