//
//  MenuView.swift
//  ARGame
//
//  Created by Rebecca Mello on 02/06/22.
//

import SwiftUI

struct MenuView: View {
    @AppStorage("shouldShowOnBoarding") var shouldShowOnBoarding: Bool = true
    @State private var showingGame = false
    
    var body: some View {
        if !showingGame {
            NavigationView {
                ZStack {
                    Color("BackgroundColor").ignoresSafeArea(.all)
                    
                    VStack (alignment: .center){
                        
                        Text("defusAR")
                            .foregroundColor(Color("BlueColor"))
                            .font(.custom(
                                "DESIGNER", size: 100
                        ))
                            .padding()
                        
                        Image("imgMenu")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.35)
                            .scaledToFit()
                            .padding()
                        
                        CustomButtons(text: "Começar", backgroundColor: Color("AccentColor"), foregroundColor: Color("BackgroundColor"), action: {
                            showingGame = true
                        })
                        .padding()
                    }
                }
                .preferredColorScheme(.dark)
            }
            .fullScreenCover(isPresented: $shouldShowOnBoarding, content: {
                OnBoardingView(shouldShowOnBoarding: $shouldShowOnBoarding)
            })
        } else {
            Player1GameView()
        }
        
    }
    
}

#if DEBUG
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
#endif
