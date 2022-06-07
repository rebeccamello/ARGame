//
//  MenuView.swift
//  ARGame
//
//  Created by Rebecca Mello on 02/06/22.
//

import SwiftUI

struct MenuView: View {
    @AppStorage("shouldShowOnBoarding") var shouldShowOnBoarding: Bool = true
    @State private var showingCamera: Bool = false
    @State private var showingGame: Bool = false
    
    var body: some View {
        if !showingGame {
            NavigationView {
                ZStack {
                    Color("BackgroundColor")
                        .ignoresSafeArea(.all)
                    
                    VStack (alignment: .center){
                        
                        Text("NOME DO JOGO")
                            .foregroundColor(Color("AccentColor"))
                            .font(.system(size: 30, design: .default))
                            .padding()
                        
                        Image("imgMenu")
                            .resizable()
                            .scaledToFit()
                            .padding()
                        
                        CustomButtons(text: "Começar", backgroundColor: Color("AccentColor"), foregroundColor: Color("BackgroundColor"), action: {
                            showingCamera = true
                        })
                        .padding()
                    }
                }
                .preferredColorScheme(.dark)
            }
            .fullScreenCover(isPresented: $shouldShowOnBoarding) {
                OnBoardingView(shouldShowOnBoarding: $shouldShowOnBoarding)
            }
            .fullScreenCover(isPresented: $showingCamera) {
                CameraView(showingCamera: $showingCamera, showingGame: $showingGame)
            }
        } else {
            DefuseGameView()
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
