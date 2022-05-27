//
//  ContentView.swift
//  Shared
//
//  Created by Sreya Reddy on 09/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var objectContent: ViewModel
    
    @State var isLoading: Bool = false
    @State var showMenu = false
    
    var body: some View {
        return GeometryReader { geometry in
            ZStack(alignment: .leading) {
                if isLoading {
                    LoadingView().transition(.opacity).zIndex(1)
                }
                
                NavigationView {
                    Home(data: objectContent, showMenu: self.$showMenu)
                        .navigationBarTitle("", displayMode: .inline)
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        
                }
                .zIndex(0)
                
                if self.showMenu {
                    MenuView()
                        .frame(width: geometry.size.width/2)
                        .transition(.move(edge: .leading))
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { withAnimation{ isLoading = false }
                })
            }
        }
    }
}

struct Home: View {
    let data: ViewModel
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }){
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Text("KNU Museum")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                NavigationLink(destination: AIview()){
                    Image(systemName: "desktopcomputer")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 40){
                    ForEach(data.objects){ i in
                        Card(data: i)
                    }
                }
            }
            
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color2"), Color("Color3")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct Card: View {
    
    var data: ViewModel.Object
    
    var body: some View {
        HStack{
            Image(self.data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width / 1.8)
            
            Spacer()
            
            VStack(spacing: 20){
                Spacer(minLength: 0)
                
                
                Text(self.data.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white.opacity(0.8))

                Spacer()
                
                NavigationLink(destination: Detail(data: self.data)) {
                    Text("See Details")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background(Capsule().stroke(.white.opacity(0.8), lineWidth: 2))
                    
                }
                .offset(y: -35)
            }
            .padding(.trailing)
            .rotation3DEffect(.init(degrees: 15), axis: (x: 0, y: -1, z: 0))
        }
        .frame(height: 290)
        .background(
            Color.white.opacity(0.2)
                .cornerRadius(25)
            // Rotate view in a 3D Angle
                .rotation3DEffect(.init(degrees: 20), axis: (x: 0, y: -1, z: 0))
            // Trimming the View
                .padding(.vertical, 35)
                .padding(.trailing, 25)
        )
        .padding(.horizontal)
    }
}


struct LoadingView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color5")]),startPoint: .top, endPoint: .trailing)
                        .edgesIgnoringSafeArea(.all)
            
            Image("appicon_t")
                .resizable()
                .frame(width: 200, height: 180)
                .aspectRatio(contentMode: .fit)
                
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let data = ViewModel()
        ContentView(objectContent: data)
    }
}
