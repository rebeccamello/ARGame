//
//  ContentView.swift
//  ARGame
//
//  Created by Rebecca Mello on 01/06/22.
//

import SwiftUI
import RealityKit

struct ARVariables{
    static var arView: ARView!
}

struct Player1GameView : View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea(.all)
            VStack {
                ARViewContainer()
                    .edgesIgnoringSafeArea(.all)
                
                CustomButtons(text: "Tirar foto", backgroundColor: Color("BlueColor"), foregroundColor: Color("ForegroundColor"), action: {
                    ARVariables.arView.snapshot(saveToHDR: false) { (image) in
                        // Compress the image
                        let compressedImage = UIImage(
                            data: (image?.pngData())!)
                        print("tirou a foto")
                    }
                })
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        ARVariables.arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadPlantingBomb()
        
        // Add the box anchor to the scene
        ARVariables.arView.scene.anchors.append(boxAnchor)
        
        return ARVariables.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Player1GameView()
    }
}
#endif
