//
//  ContentView.swift
//  ARGame
//
//  Created by Rebecca Mello on 01/06/22.
//

import SwiftUI
import RealityKit

struct Player2GameView : View {
    var body: some View {
        VStack {
            ARViewContainer().edgesIgnoringSafeArea(.all)
            
            CameraButton()
        }
    }
}

struct ARViewContainer2: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadPlantingBomb()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

#if DEBUG
struct ContentView_Previews2 : PreviewProvider {
    static var previews: some View {
        Player2GameView()
    }
}
#endif
