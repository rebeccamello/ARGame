//
//  ContentView.swift
//  ARGame
//
//  Created by Rebecca Mello on 01/06/22.
//

import SwiftUI

enum ImageNames: String {
    case tia = "TIA"
    case bu = "BU"
}

struct DefuseGameView: View {
    @State var showButton: Bool = false
    
    var body: some View {
        VStack {
            ARViewContainer(showButton: $showButton, isPlanting: false)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#if DEBUG
struct ARViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        DefuseGameView()
    }
}
#endif
