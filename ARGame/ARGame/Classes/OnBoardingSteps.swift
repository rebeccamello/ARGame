//
//  OnBoardingSteps.swift
//  ARGame
//
//  Created by Rebecca Mello on 02/06/22.
//

import SwiftUI

struct onBoardingSteps: View {
    var numerOfStep: Int
    var title: String
    var description: String
    
    var body: some View {
        HStack {
            Text(String(numerOfStep))
                .font(.system(size: 50, design: .rounded))
                .foregroundColor(Color("BlueColor"))
                .bold()
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 18, design: .rounded))
                    .foregroundColor(Color("TextColor"))
                .bold()
                Text(description)
                    .font(.system(size: 18, design: .rounded))
                    .foregroundColor(Color("TextColor"))
            }
        }.padding()
    }
}
