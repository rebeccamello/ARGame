//
//  ContentView.swift
//  ARGame
//
//  Created by Rebecca Mello on 01/06/22.
//

import SwiftUI
import ARKit
import RealityKit

struct Player2GameView : View {
    var imageToTrack: UIImage
    
    var body: some View {
        VStack {
            ARViewContainer2(imageToTrack: imageToTrack)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ARViewContainer2: UIViewRepresentable {
    var imageToTrack: UIImage
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let arImage = ARReferenceImage(imageToTrack.cgImage!, orientation: .up, physicalWidth: 0.01)
        arImage.name = "Image"
        
        var referenceImage = Set<ARReferenceImage>()
        referenceImage.insert(arImage)
        
        let session = arView.session
        let config = ARImageTrackingConfiguration()
        config.trackingImages = referenceImage
        config.maximumNumberOfTrackedImages = 1
        
        session.run(config, options: [.resetTracking, .removeExistingAnchors])
        
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
        Player2GameView(imageToTrack: UIImage())
    }
}
#endif
