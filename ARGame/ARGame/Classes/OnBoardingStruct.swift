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
                    Text("NOME DO JOGO")
                        .font(.system(size: 42, design: .rounded))
                        .foregroundColor(Color("TitleColor"))
                        .padding()
                    
                    Text("Player 1")
                        .font(.system(size: 40, design: .rounded))
                        .foregroundColor(Color("TitleColor"))
                }
                VStack (alignment: .leading) {
                    onBoardingSteps(numerOfStep: 1, title: "Escolha um objeto", description: "Escolha um objeto no ambiente em que você está")
                    
                    onBoardingSteps(numerOfStep: 2, title: "Selecione o objeto", description: "Selecione o objeto para esconder a bomba")
                    
                    onBoardingSteps(numerOfStep: 3, title: "Configure o tempo", description: "Indique em quanto tempo o outro jogador deve encontrar o objeto com a bomba")
                }
            }
        } else {
            VStack (alignment: .center) {
                Text("Player 2")
                    .font(.system(size: 40, design: .rounded))
                    .foregroundColor(Color("TitleColor"))
                
                
                onBoardingSteps(numerOfStep: 1, title: "Encontre o objeto", description: "Ande pelo ambiente que está inserido o objeto e o encontre")
                
                onBoardingSteps(numerOfStep: 2, title: "Desative a bomba", description: "Faça TAL CoISA para desativar a bomba antes que o tempo acabe e ela exploda")
                
                CustomButtons(text: "Continuar", backgroundColor: Color("ActionColor"), foregroundColor: Color("BackgroundColor"), action: {
                    shouldShowOnBoarding.toggle()
                })
            }
        }
        
    }
}
