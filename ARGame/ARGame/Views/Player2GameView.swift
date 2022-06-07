//
//  ContentView.swift
//  ARGame
//
//  Created by Rebecca Mello on 01/06/22.
//

import SwiftUI
import ARKit
import RealityKit

struct Player2GameView: View {
    var imageToTrack: UIImage
    @StateObject private var viewModel = ViewModel()
        
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        if !viewModel.showingAlert {
            VStack {
                ARViewContainer2(imageToTrack: imageToTrack)
                    .edgesIgnoringSafeArea(.all)
                
                Text("\(viewModel.time)")
                    .foregroundColor(Color("AccentColor"))
                    .font(.system(size: 30, design: .default))
                
                Button("Começar") {
                    viewModel.start(minutes: viewModel.minutes)
                }
                .disabled(viewModel.isActive)
                
            }
            .onReceive(timer) { _ in
                viewModel.updateCountdown()
            }
        } else {
            GameOverView(titleText: "Parabens", text: "oi", time: "0", imageName: "bomba1")
        }
    }
}

struct ARViewContainer2: UIViewRepresentable {
    var imageToTrack: UIImage
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
//        let arImage = ARReferenceImage(imageToTrack.cgImage!, orientation: .up, physicalWidth: 0.01)
//        arImage.name = "Image"
        
//        var referenceImage = Set<ARReferenceImage>()
//        referenceImage.insert(arImage)
        
        let session = arView.session
        let config = ARImageTrackingConfiguration()
//        config.trackingImages = referenceImage
//        config.maximumNumberOfTrackedImages = 1
        
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
