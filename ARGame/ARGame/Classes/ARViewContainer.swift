//
//  ARViewContainer.swift
//  ARGame
//
//  Created by Rebecca Mello on 07/06/22.
//

import Foundation
import SwiftUI
import ARKit
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var showButton: Bool
    var isPlanting: Bool
    var arView = ARView(frame: .zero)
//    let button = UIButton(configuration: .filled())
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, showButton: $showButton)
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        @Binding var showButton: Bool
        var parent: ARViewContainer
        
        init(_ parent: ARViewContainer, showButton: Binding<Bool>) {
            self.parent = parent
            self._showButton = showButton
        }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            guard let imageAnchor = anchors[0] as? ARImageAnchor else {
                print("Problems loading anchor.")
                return
            }
            
            if let imageName = imageAnchor.name, let _ = ImageNames(rawValue: imageName) {
                
                let anchorEntity = AnchorEntity(anchor: imageAnchor)
                
                if let scene = try? Experience.loadPlantingBomb() {
                    if let bomb = scene.findEntity(named: "Bomb") {
                        anchorEntity.addChild(bomb)
                        parent.arView.scene.addAnchor(anchorEntity)
                        parent.showButton = true
//                        parent.button.alpha = 1
                    }
                }
            }
        }
    }
    
    func makeUIView(context: Context) -> ARView {
//        arView.addSubview(button)
//        button.setTitle("AOBA", for: .normal)
//        button.alpha = 0
//
//        button.leadingAnchor.constraint(equalTo: arView.leadingAnchor, constant: 30).isActive = true
//        button.trailingAnchor.constraint(equalTo: arView.trailingAnchor, constant: -30).isActive = true
//        button.topAnchor.constraint(equalTo: arView.bottomAnchor, constant: -120).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
//
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//        button.addTarget(self, action: #selector(changeView()), for: .touchUpInside)
        
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
