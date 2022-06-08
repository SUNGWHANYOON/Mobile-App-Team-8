//
//  Detail.swift
//  KNU Museum
//
//  Created by Sreya Reddy on 15/05/22.
//

import SwiftUI

struct Detail: View {
    
    var data: ViewModel.Object
    var english: Bool
    
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
                    
                    NavigationLink(destination: Augmented_Reality_View(obj: data).edgesIgnoringSafeArea(.all)){
                        Image(systemName: "move.3d")
                            .font(.title)
                            .foregroundColor(.white)
                    }


                }
                if english {
                    Text("Details")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                } else {
                    Text("유물 정보")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                Image(self.data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 2)
                .background(Color.white.opacity(0.2))
                .cornerRadius(30)
            
            if english {
                Text(self.data.ename)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top)
                
                Text(self.data.einfo)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .padding([.top, .horizontal], 20)
                
            } else {
                Text(self.data.name)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top)
                
                
                Text(self.data.info)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .padding([.top, .horizontal], 15)
                
            }
            
            Spacer()
            }
            
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color2"), Color("Color4")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
