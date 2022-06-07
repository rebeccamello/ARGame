//
//  ContentView.swift
//  ARGame
//
//  Created by Rebecca Mello on 01/06/22.
//

import SwiftUI
import ARKit
import RealityKit

struct DefuseGameView: View {
    var body: some View {
        VStack {
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    var arView = ARView(frame: .zero)
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        var parent: ARViewContainer
        
        init(_ parent: ARViewContainer) {
            self.parent = parent
        }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            guard let imageAnchor = anchors[0] as? ARImageAnchor else {
                print("Problems loading anchor.")
                return
            }
            
            if let imageName = imageAnchor.name, imageName  == "Image" {
                let anchor = AnchorEntity(anchor: imageAnchor)
                
                if let scene = try? Experience.loadPlantingBomb() {
                    if let bomb = scene.findEntity(named: "Bomb") {
                        anchor.addChild(bomb)
                        parent.arView.scene.addAnchor(anchor)
                    }
                }
            }
        }
        
//        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
//            guard let imageAnchor = anchors[0] as? ARImageAnchor else {
//                print("Problems loading anchor.")
//                return
//            }
//        }
    }
    
    func makeUIView(context: Context) -> ARView {
        let configuration = ARImageTrackingConfiguration()
        
        if let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) {
            configuration.isAutoFocusEnabled = true
            configuration.trackingImages = referenceImages
            configuration.maximumNumberOfTrackedImages = 1
        } else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        arView.session.delegate = context.coordinator
        arView.session.run(configuration)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

#if DEBUG
struct ContentView_Previews2 : PreviewProvider {
    static var previews: some View {
        DefuseGameView()
    }
}
#endif
