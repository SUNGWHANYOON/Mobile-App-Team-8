//
//  OpenGallery.swift
//  KNU Museum
//
//  Created by 윤성환 on 2022/05/15.
//

import SwiftUI
import UIKit
import CoreML
import Vision


struct ImagePicker: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var textstring : String
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
               
                predimage(image: image)
                
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
        func predimage(image : UIImage?) {
        guard let buffer = image?.resizeImageTo(size: CGSize(width : 224, height: 224))?
            .convertToBuffer() else {
        return
        }
            do{
       
        let config = MLModelConfiguration ()
        let model = try  Classifier(configuration: config)
        let input = ClassifierInput(image: buffer)
        let output = try model.prediction(input: input)
        //let text =  output.label
            parent.textstring = output.classLabel
                
        //parent.selectedtext.text = text
                print("predicted value",parent.textstring)
                print("probability value",output.classLabelProbs)
            
            }
            catch{
        print(error.localizedDescription )
            }
        }
    }
    
    
}

