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
    var gameDataViewModel: GameDataViewModel
    
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
            for anchor in anchors {
                guard let imageAnchor = anchor as? ARImageAnchor else { return }
                
                if parent.isPlanting {
                    if let imageName = imageAnchor.name, let _ = Card(rawValue: imageName) {
                        let anchorEntity = AnchorEntity(anchor: imageAnchor)
                        if let scene = try? Experience.loadPlantingBomb() {
                            if let bomb = scene.findEntity(named: "Bomb") {
                                anchorEntity.addChild(bomb)
                                parent.arView.scene.addAnchor(anchorEntity)
                            }
                        }
                    }
                } else {
                    if let bombedCard = parent.gameDataViewModel.bombedCard, let imageName = imageAnchor.name, imageName == bombedCard.rawValue {
                        let anchorEntity = AnchorEntity(anchor: imageAnchor)
                        if let scene = try? Experience.loadPlantingBomb() {
                            if let bomb = scene.findEntity(named: "Bomb") {
                                anchorEntity.addChild(bomb)
                                parent.arView.scene.addAnchor(anchorEntity)
                            }
                        }
                    }
                }
            }
        }
        
        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
            for anchor in anchors {
                guard let imageAnchor = anchor as? ARImageAnchor else { return }
                
                if let imageName = imageAnchor.name, Card(rawValue: imageName) != nil {
                    parent.showButton = true
                    parent.gameDataViewModel.bombedCard = Card(rawValue: imageName)
                }
                
                if !imageAnchor.isTracked {
                    parent.showButton = false
                }
            }
        }
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
        arView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
