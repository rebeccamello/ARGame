//
//  MenuView.swift
//  ARGame
//
//  Created by Rebecca Mello on 02/06/22.
//

import SwiftUI

struct MenuView: View {
    @AppStorage("shouldShowOnBoarding") var shouldShowOnBoarding: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea(.all)
                CustomButtons(text: "Começar", backgroundColor: Color("ActionColor"), foregroundColor: Color("BackgroundColor"), action: {
                    print("vai pro jogo")
                })
            }
        }
        .fullScreenCover(isPresented: $shouldShowOnBoarding, content: {
            OnBoardingView(shouldShowOnBoarding: $shouldShowOnBoarding)
        })
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
