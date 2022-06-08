//
//  MenuView.swift
//  KNU Museum
//
//  Created by 위재원 on 2022/05/26.
//

import SwiftUI

struct MenuView: View {
    @State private var Boolshow = false
    var english: Bool
    var body: some View {
        
            return GeometryReader { geometry in
                NavigationView{
                VStack(alignment: .leading) {
                    Link(destination: URL(string: "https://museum.knu.ac.kr/")!){
                        Image(systemName: "house")
                        if english {
                            Text("Website")
                        } else {
                            Text("웹사이트")
                        }
                        
                    }
                    .padding(.top, 120)
                    .foregroundColor(Color("Color5"))
                                        
                    Link(destination: URL(string: "https://www.facebook.com/knumuseum")!){
                        Image(systemName: "hand.thumbsup.fill")
                        if english {
                            Text("Facebook")
                        } else {
                            Text("페이스북")
                        }
                    }
                    .padding(.top, 30)
                    .foregroundColor(Color("Color5"))

                    
                    
                    Link(destination: URL(string: "https://www.instagram.com/knu_museum/")!){
                        Image(systemName: "heart.fill")
                        if english {
                            Text("Instagram")
                        } else {
                            Text("인스타그램")
                        }
                    }
                    .padding(.top, 30)
                    .foregroundColor(Color("Color5"))

                    
                    
                    ZStack{
                        HStack{
                    Image(systemName: "questionmark.circle")
                    
                            Button{
                                self.Boolshow = true
                            }label:{
                                if english{
                                    Text("Information")
                                        .foregroundColor(Color("Color5"))

                                } else {
                                    Text("정보")
                                        .foregroundColor(Color("Color5"))

                                }
                        }
                        }
                        .sheet(isPresented: $Boolshow){
                            InfoView(english: self.english)
                              }
                    }
                    .padding(.top, 30)
                    Spacer()

                }
            }
        }
    }
}
