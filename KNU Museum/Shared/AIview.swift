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

    init(data: String){
        self.data = data
    }
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.2))
            Button{

            }label:{
                Text(self.data)
                    .font(.title)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
        }
        Spacer()
    }
}

