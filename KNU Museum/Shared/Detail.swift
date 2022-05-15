//
//  Detail.swift
//  KNU Museum
//
//  Created by Sreya Reddy on 15/05/22.
//

import SwiftUI

struct Detail: View {
    
    var data: ViewModel.Object
    
    // Used to pop the top most view on the stack
    @Environment(\.presentationMode) var present
    
    var body: some View {
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
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "circle.grid.2x2.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    }


                }
                Text("Details")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding()
            
            Image(self.data.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 2)
                .background(Color.white.opacity(0.2))
                .cornerRadius(30)
            
            Text(self.data.name)
                .fontWeight(.bold)
                .font(.system(size: 55))
                .foregroundColor(.white)
                .padding(.top)
            
            Text(self.data.info)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.top)
            
            Spacer()
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color2"), Color("Color4")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
