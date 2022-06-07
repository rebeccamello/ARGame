//
//  CameraView.swift
//  ARGame
//
//  Created by Vitor Grechi Kuninari on 06/06/2022.
//

import Foundation
import UIKit
import SwiftUI

var cachedImage: UIImage? = nil

struct CameraView: UIViewControllerRepresentable {
    @Binding var showingCamera: Bool
    @Binding var showingGame: Bool
    
    typealias UIViewControllerType = UIImagePickerController
    
    func makeCoordinator() -> CameraView.Coordinator {
        return Coordinator(showingCamera: $showingCamera, showingGame: $showingGame)
    }
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = UIViewControllerType()
        viewController.delegate = context.coordinator
        viewController.sourceType = .camera
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

extension CameraView {
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var showingCamera: Bool
        @Binding var showingGame: Bool
        
        init(showingCamera: Binding<Bool>, showingGame: Binding<Bool>) {
            self._showingCamera = showingCamera
            self._showingGame = showingGame
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            print("Cancel pressed")
            picker.dismiss(animated: true)
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey:Any]) {
            guard let image = info[.originalImage] as? UIImage else {
                print("No image found")
                return
            }
            
            cachedImage = image
            showingCamera = false
            showingGame = true
        }
    }
}
