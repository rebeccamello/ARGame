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
    @AppStorage("ImageToTrack") var imageToTrack: Data = Data()
    
    var body: some View {
        //        ZStack {
        //            Color("BackgroundColor").ignoresSafeArea(.all)
        ZStack(alignment: .bottom) {
            ARViewContainer()
                .edgesIgnoringSafeArea(.all)
            
            Button {
                ARVariables.arView.snapshot(saveToHDR: false) { (image) in
                    // Compress the image
                    if let image = image {
                        imageToTrack = image.pngData()!
                        print("Foto guardada no UserDefaults")
                    } else {
                        fatalError("Não conseguiu salvar a imagem no UserDefaults")
                    }
                }
            } label: {
                Image(systemName: "camera")
                    .frame(width:60, height:60)
                    .font(.title)
                    .background(Color("BackgroundColor")
                    .opacity(0.75))
                    .cornerRadius(30)
                    .foregroundColor(Color("BlueColor"))
                    .padding()
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
