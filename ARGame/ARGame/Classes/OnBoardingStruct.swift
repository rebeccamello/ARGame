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
                VStack (alignment: .center) {
                    Text("Player 1")
                        .font(.system(size: 40, design: .default))
                        .foregroundColor(Color("ForegroundColor"))
                }
                
                VStack (alignment: .leading) {
                    OnBoardingSteps(stepNumber: 1, title: "Escolha um objeto", description: "Escolha um objeto no ambiente em que você está")
                    
                    OnBoardingSteps(stepNumber: 2, title: "Tire foto do objeto", description: "Capture uma imagem de perto do objeto para esconder a bomba")
                    
                    OnBoardingSteps(stepNumber: 3, title: "Configure o tempo", description: "Indique em quanto tempo o outro jogador deve encontrar o objeto com a bomba")
                }
            }
        } else {
            VStack {
                VStack(alignment: .leading) {
                    Image("lupa")
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
                
                VStack (alignment: .leading) {
                    
                    OnBoardingSteps(stepNumber: 1, title: "Encontre o objeto", description: "Ande pelo ambiente que está inserido o objeto e o encontre")
                    
                    OnBoardingSteps(stepNumber: 2, title: "Desative a bomba", description: "Faça TAL CoISA para desativar a bomba antes que o tempo acabe e ela exploda")
                    
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
struct OnBoardingStruct_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingStruct(playerNumber: 1, shouldShowOnBoarding: .constant(true))
            .background(Color("BackgroundColor"))
            .previewLayout(.sizeThatFits)
    }
}
#endif
