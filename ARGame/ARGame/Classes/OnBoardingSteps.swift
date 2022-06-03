//
//  OnBoardingSteps.swift
//  ARGame
//
//  Created by Rebecca Mello on 02/06/22.
//

import SwiftUI

struct OnBoardingSteps: View {
    var stepNumber: Int
    var title: String
    var description: String
    
    var body: some View {
        HStack {
            Text(String(stepNumber))
                .font(.system(size: 50, design: .default))
                .bold()
                .foregroundColor(Color("AccentColor"))
                .padding()
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 18, design: .rounded))
                    .bold()
                    .foregroundColor(Color("ForegroundColor"))
                
                Text(description)
                    .font(.system(size: 18, design: .default))
                    .foregroundColor(Color("ForegroundColor"))
            }
        }
        .padding()
    }
}

#if DEBUG
struct OnBoardingSteps_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingSteps(stepNumber: 1, title: "Título", description: "Descrição aqui.")
            .background(Color("BackgroundColor"))
            .previewLayout(.sizeThatFits)
    }
}
#endif
