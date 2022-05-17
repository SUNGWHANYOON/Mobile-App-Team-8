//
//  AIview.swift
//  KNU Museum
//
//  Created by 윤성환 on 2022/05/15.
//

import SwiftUI

struct AIview: View {
    
    @Environment(\.presentationMode) var present
    
    @State private var Boolshowlibrary = false
    @State private var BoolshowCamera = false

    @State private var nowimage = UIImage()
    
    var body: some View {
        GeometryReader{Geometry in
            VStack {
                ZStack {
                    HStack {
                        Button {
                            // pop the view when the back button is pressed
                            self.present.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Spacer()
                    }
                    Text("AI view")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                Image(uiImage: self.nowimage)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 2)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(30)
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.2))
                    Button{
                        self.Boolshowlibrary = true
                    }label:{
                        Text("Upload From Gallery")
                            .font(.title)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.horizontal)
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.2))
                    Button{
                        self.BoolshowCamera = true
                    }label:{
                        Text("Take Photo")
                            .font(.title)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.horizontal)
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.2))
                    Button{
                    }label:{
                        Text("Predict")
                            .font(.title)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.horizontal)
                
            }
            .sheet(isPresented: $Boolshowlibrary){
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$nowimage)
            }
            .sheet(isPresented: $BoolshowCamera){
                ImagePicker(sourceType: .camera, selectedImage: self.$nowimage)
            }
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color2"), Color("Color4")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
