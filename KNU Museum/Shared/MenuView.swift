//
//  MenuView.swift
//  KNU Museum
//
//  Created by 위재원 on 2022/05/26.
//

import SwiftUI

struct MenuView: View {
    @State private var Boolshow = false
    var body: some View {
        
            return GeometryReader { geometry in
                NavigationView{
                VStack(alignment: .leading) {
                    HStack{
                        Image(systemName: "star")
                        Text("Must See")
                    }
                    .padding(.top, 120)
                    
                    Link(destination: URL(string: "https://museum.knu.ac.kr/")!){
                        Image(systemName: "house")
                        Text("Website")
                    }
                    .padding(.top, 30)
                    .foregroundColor(.white)
                    
                    Link(destination: URL(string: "https://www.facebook.com/knumuseum")!){
                        Image(systemName: "hand.thumbsup.fill")
                        Text("Facebook")
                    }
                    .padding(.top, 30)
                    .foregroundColor(.white)
                    
                    Link(destination: URL(string: "https://www.instagram.com/knu_museum/")!){
                        Image(systemName: "heart.fill")
                        Text("Instagram")
                    }
                    .padding(.top, 30)
                    .foregroundColor(.white)
                    
                    ZStack{
                        HStack{
                    Image(systemName: "questionmark.circle")
                    
                            Button{
                                self.Boolshow = true
                            }label:{
                                Text("Information")
                                    .foregroundColor(.white)
                        }
                        }
                        .sheet(isPresented: $Boolshow){
                            InfoView()
                              }
                    }
                    .padding(.top, 30)
                    Spacer()

                }
            }
        }
    }
}
