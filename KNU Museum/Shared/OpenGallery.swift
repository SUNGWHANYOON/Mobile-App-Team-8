//
//  OpenGallery.swift
//  KNU Museum
//
//  Created by 윤성환 on 2022/05/15.
//

import SwiftUI
import Foundation
import UIKit

struct ImagePickerView: UIViewControllerRepresentable{
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>)-> UIImagePickerController{
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        //context
    }
}

struct OpenGallery: View{
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    var body: some View{
        VStack{
            Image(uiImage: self.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                self.isShowPhotoLibrary = true
            }) {
                HStack{
                    Image(systemName : "photo")
                        .font(.system(size:20))
                    
                    Text("Photo library")
                        .font(.headline)
                }
                .frame(minWidth: 0, idealWidth: .infinity, minHeight: 0, maxHeight: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding(.horizontal)
            }
        }
    }
}
