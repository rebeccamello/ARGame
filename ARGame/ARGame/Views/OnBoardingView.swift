//
//  OnBoardingView.swift
//  ARGame
//
//  Created by Rebecca Mello on 02/06/22.
//

import SwiftUI

struct OnBoardingView: View {
    @Binding var shouldShowOnBoarding: Bool
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            TabView {
                OnBoardingStruct(playerNumber: 1, shouldShowOnBoarding: $shouldShowOnBoarding)
                
                OnBoardingStruct(playerNumber: 2, shouldShowOnBoarding: $shouldShowOnBoarding)
            }
            .tabViewStyle(PageTabViewStyle() )
        }
        .preferredColorScheme(.dark)
    }
}

#if DEBUG
struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView(shouldShowOnBoarding: .constant(true))
    }
}
#endif
