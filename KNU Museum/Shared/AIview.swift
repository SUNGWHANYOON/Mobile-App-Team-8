//
//  AIview.swift
//  KNU Museum
//
//  Created by 윤성환 on 2022/05/15.
//


import SwiftUI
import UIKit

struct AIview: View {
    
    @Environment(\.presentationMode) var present
    
    @State private var Boolshowlibrary = false
    @State private var BoolshowCamera = false
    @State private var boolState = false
    @State private var nowimage = UIImage()
    @State private var predictvalue: String = "1"
        
    var data : ViewModel
    var english: Bool
  
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
                                .padding(.horizontal)
                                .padding(.vertical)
                        }
                        Spacer()
                        Spacer()
                    }
                    if english {
                        Text("AI Prediction")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                    } else {
                        Text("상세 정보")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                    }
                    
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
                        self.boolState = true
                    }label:{
                        if english {
                            Text("Upload From Gallery")
                                .font(.title)
                                .foregroundColor(.white.opacity(0.8))
                        } else {
                            Text("갤러리에서 가져오기")
                                .font(.title)
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                }
                .padding(.horizontal)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.2))
                    Button{
                        self.BoolshowCamera = true //camera test part
                        self.boolState = true

                    }label:{
                        if english {
                            Text("Take Photo")
                                .font(.title)
                                .foregroundColor(.white.opacity(0.8))
                        } else {
                            Text("사진 찍기")
                                .font(.title)
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                }
                .padding(.horizontal)
               // if self.boolState{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.2))
                        NavigationLink(destination:Detail(data: self.data.objects.first(where:{$0.id == Int(predictvalue)})!, english: self.english)
                            ,label:{
                            if english {
                                Text("Predict")
                                    .font(.title)
                                    .foregroundColor(.white.opacity(0.8))
                            } else {
                                Text("예측하기")
                                    .font(.title)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            
                        }).simultaneousGesture(TapGesture().onEnded{
                            
                            self.predictvalue = AIPredict(image : self.nowimage).classifyImage()
                            print(predictvalue)
                        })
                        
                    }
                    .padding(.horizontal)
                
            }
            .sheet(isPresented: $Boolshowlibrary){
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$nowimage)
            }
            .sheet(isPresented: $BoolshowCamera){
                ImagePicker(sourceType: .camera, selectedImage: self.$nowimage)
            } // camera test part
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color2"), Color("Color4")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}


extension AIview{
    
    func SetPredictvalue(){
        if boolState{
            self.predictvalue = AIPredict(image : self.nowimage).classifyImage()
        }
    }
}
