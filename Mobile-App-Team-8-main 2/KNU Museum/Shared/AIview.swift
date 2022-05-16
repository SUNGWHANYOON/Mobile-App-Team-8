//
//  AIview.swift
//  KNU Museum
//
//  Created by 윤성환 on 2022/05/15.
//

import SwiftUI

struct AIview: View {
   
    @Environment(\.presentationMode) var present
 
    var body: some View {
        GeometryReader{Geometry in
            VStack {
                ZStack {
                    HStack {
                        Button {
                            // pop the view when the back button is pressed
                            self.present.wrappedValue.dismiss()
                        }
                    label: {
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
                Image("Image1")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 2)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(30)
                
                AIbutton(data: "Upload From Gallery")
                AIbutton(data: "Take Photo")
                AIbutton(data: "Predict")
            }
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color2"), Color("Color4")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
 
}

struct AIbutton: View{
    
    var data: String
    @State private var image: Image?
    @State var imgpicker : Bool = false
    @State private var inputimage: UIImage?
    @Environment(\.presentationMode) var present
    
    var body: some View{
        //NavigationView{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
        
            Button(action: {
                imgpicker.toggle()
             }) {
                 if (self.data == "Upload From Gallery"){
                     NavigationLink(destination: upload_gallery(imgpicker: $imgpicker)) {
                       Text(self.data)
                     }}
                 if (self.data == "Take Photo"){
                   NavigationLink(destination: Text("photo")) {
                     Text(self.data)
                   }}
                 if (self.data == "Predict") { NavigationLink(destination: Text("predict here")) {
                     Text(self.data)
                   }}
                 
             }.padding()
        }
       // }
        Spacer()
    }
}


struct upload_gallery: View{
    @State private var image: Image?
    @Binding var imgpicker : Bool
    @State private var inputimage: UIImage?
    //print("value",imgpicker)
    var body:some View{
    NavigationView {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.brown)
                    //.padding([.horizontal,.vertical,.top,.bottom])
                    .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 1)
                   // .padding()
                    //.background(Color.secondary)
               Text("Select")
                 .foregroundColor(.black)
                   .font(.title2)

                image?
                    .resizable()
                   // .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 2)
                   
                    //.background(Color.white.opacity(0.2))
                    .background(LinearGradient(gradient: .init(colors: [Color("Color2"), Color("Color4")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
                   
                    .cornerRadius(30)
            }
           
             .onTapGesture {
              imgpicker = true
            }
     Spacer()
             .padding()
        }
       
      
            
        }
   
    
    .padding([.horizontal, .bottom,.top, .vertical])
        .background(LinearGradient(gradient: .init(colors: [Color("Color2"), Color("Color4")]), startPoint: .top, endPoint: .bottom))
        .onChange(of: inputimage){_ in load_image()}
        .sheet(isPresented: $imgpicker){
            ImagePicker(image: $inputimage)
        }
    }
    
    
func load_image(){
    guard let inputimage = inputimage else {return}
    image = Image(uiImage: inputimage)
}

}
