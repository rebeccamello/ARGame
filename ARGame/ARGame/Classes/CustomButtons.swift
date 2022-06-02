//
//  CustomButtons.swift
//  ARGame
//
//  Created by Rebecca Mello on 02/06/22.
//

import SwiftUI

struct CustomButtons: View {
    var text: String
    var backgroundColor: Color
    var foregroundColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .frame(width: 200, height: 44)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(10)
        }
        .padding()
    }
}
