//
//  OnBoardingStruct.swift
//  ARGame
//
//  Created by Rebecca Mello on 02/06/22.
//

import Foundation
import SwiftUI

struct OnBoardingStruct: View {
    var playerNumber: Int
    @Binding var shouldShowOnBoarding: Bool
    
    var body: some View {
        if (playerNumber == 1) {
            VStack {
                VStack(alignment: .leading) {
                    Image("bomba2")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.35)
                        .scaledToFit()
                        .padding(.top, 40)
                        .padding(.leading, 40)
                        .padding(.bottom, 0)
                }
                
                VStack (alignment: .leading) {
                    OnBoardingSteps(stepNumber: 1, title: "Escolha a âncora", description: "Escolha o objeto que será a âncora onde a bomba ficará escondida")
                    
                    OnBoardingSteps(stepNumber: 2, title: "Plante a bomba", description: "Aperte no botão 'Plantar âncora' para que a bomba se instale nele")
                    
                    OnBoardingSteps(stepNumber: 3, title: "Configure o tempo", description: "Indique em quanto tempo o outro jogador deve encontrar o objeto com a bomba")
                }
            }
        } else {
            VStack {
                VStack(alignment: .leading) {
                    Image("lupa")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.3)
                        .scaledToFit()
                        .padding()
                }
                
                VStack (alignment: .leading) {
                    
                    OnBoardingSteps(stepNumber: 1, title: "Encontre o objeto", description: "Ande pelo ambiente que está inserido o objeto e o encontre")
                    
                    CustomButtons(text: "Continuar", backgroundColor: Color("AccentColor"), foregroundColor: Color("BackgroundColor"), action: {
                        shouldShowOnBoarding.toggle()
                    })
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
    }
}

#if DEBUG
//struct OnBoardingStruct_Previews: PreviewProvider {
//    static var previews: some View {
//        OnBoardingStruct(playerNumber: 1, shouldShowOnBoarding: .constant(true))
//            .background(Color("BackgroundColor"))
//            .previewLayout(.sizeThatFits)
//    }
//}
#endif
