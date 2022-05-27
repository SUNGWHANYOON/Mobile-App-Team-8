//
//  MenuView.swift
//  KNU Museum
//
//  Created by 위재원 on 2022/05/26.
//

import SwiftUI

struct MenuView: View {

    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                HStack{
                    Image(systemName: "star")
                    Text("Must See")
                }
                .padding(.top, 120)
                
                Link(destination: URL(string: "https://museum.knu.ac.kr/")!){
                    Image(systemName: "house")
                    Text("HomePage")
                }
                .padding(.top, 30)
                
                Link(destination: URL(string: "https://www.facebook.com/knumuseum")!){
                    Image(systemName: "hand.thumbsup.fill")
                    Text("Facebook")
                }
                .padding(.top, 30)
                
                NavigationLink(destination: InfoView()){
                    Image(systemName: "questionmark.circle")
                    Text("Information")
                }
                .padding(.top, 30)
                
                Spacer()
            
            }
        }
    }
}
