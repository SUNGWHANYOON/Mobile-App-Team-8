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
    @State private var Boolshowpred = false
    @State private var nowimage = UIImage()
    @State var textstr : String = "AI View"
   
    @ObservedObject var dataContent: ViewModel
    //@State var k : String
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
                        }
                        Spacer()
                        Spacer()
                    }
                    //Text("\(self.textstr)")
                    Text("AIView")
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
                   // .buttonStyle(ThemeAnimationStyle())
                }
                .padding(.horizontal)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.2))
                    Button{
                        self.BoolshowCamera = true //camera test part
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
                        self.Boolshowpred = true
                    }label:{
                        Text("Predict")
                            .font(.title)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.horizontal)
                
            }
            .sheet(isPresented: $Boolshowlibrary){
                
                ImagePicker(sourceType: .photoLibrary, textstring : self.$textstr, selectedImage: self.$nowimage)
                //self.k = ImagePicker(sourceType: .photoLibrary, textstring : self.textstr, selectedImage: self.$nowimage).textstring
            }
           
            .sheet(isPresented: $BoolshowCamera){
                ImagePicker(sourceType: .camera, textstring : self.$textstr,selectedImage: self.$nowimage)
               //let k = ImagePicker(sourceType: .camera, selectedImage: self.$nowimage).makeCoordinator()
            } // camera test part
            .sheet(isPresented: $Boolshowpred){
                //ImagePicker(sourceType: .photoLibrary, textstring : self.$textstr, selectedImage: self.$nowimage)
                //self.k = ImagePicker(sourceType: .photoLibrary, textstring : self.textstr, selectedImage: self.$nowimage).textstring
                NavigationLink(destination: imagepred(datainfo: self.dataContent, id_value : self.textstr)){
                    imagepred(datainfo: dataContent, id_value :self.textstr)
                       
                }
               
            }
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color2"), Color("Color4")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ThemeAnimationStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            //.font(.title2)
            .foregroundColor(Color.white)
           // .frame(height: 50, alignment: .center)
           // .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 2)
          //  .background(configuration.isPressed ? Color.green.opacity(0.5) : Color.green)
            //.cornerRadius(8)
            .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0) //<- change scale value as per need. scaleEffect(configuration.isPressed ? 1.2 : 1.0)
    }
}
