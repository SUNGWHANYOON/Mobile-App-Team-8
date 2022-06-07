//
//  Augmented_Reality_View.swift
//  KNU Museum
//
//  Created by Sreya Reddy on 06/06/22.
//

import SwiftUI
import RealityKit
import UIKit

struct Augmented_Reality_View: UIViewRepresentable {
    
    var obj: ViewModel.Object
    var anchor: Anchor.Scene!
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        
        let val = get_val()
        print("Val \(val)")
        let entity = try! ModelEntity.loadModel(named: val)
        
        entity.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation, .rotation, .scale], for: entity)
        
        let anchor: AnchorEntity = AnchorEntity(plane: .horizontal, classification: .any)

        arView.scene.addAnchor(anchor)
        anchor.addChild(entity)
        
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
    
    func get_val() -> String {
        @State var ret_val : String
        
        switch self.obj.id {
            
        case 1: ret_val = "1"
        case 2: ret_val = "2"
        case 3: ret_val = "3"
        case 4: ret_val = "4"
        case 5: ret_val = "5"
        case 6: ret_val = "6"
        case 7: ret_val = "7"
        case 8: ret_val = "8"
        case 9: ret_val = "9"
        case 10: ret_val = "10"
        default: ret_val = "1"
        }
        
        return ret_val
    }
    
}


