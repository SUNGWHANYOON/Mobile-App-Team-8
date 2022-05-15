//
//  ContentView.swift
//  Shared
//
//  Created by Sreya Reddy on 09/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var objectContent: ViewModel
    
    var body: some View {
        
        NavigationView {
            Home(data: objectContent)
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct Home: View {
    
    let data: ViewModel
    
    var body: some View {
        VStack{
            HStack{
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
                
                VStack(spacing: 10){
                    ForEach(data.objects){ i in
                        Card(data: i)
                    }
                }
                .padding(.bottom)
            }

        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color1"), Color("Color3")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct Card: View {
    
    var data: ViewModel.Object
    
    var body: some View {
        HStack{
            Image(self.data.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 1.8)
            
            Spacer()
            
            VStack(spacing: 20){
                Spacer(minLength: 0)
                
                
                Text(self.data.name)
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(.white.opacity(0.8))

                Spacer()
                
                
                NavigationLink(destination: Detail(data: self.data)) {
                    Text("See Details")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.vertical, 12)
                        .padding(.horizontal, 15)
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

// Detail View

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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let data = ViewModel()
        ContentView(objectContent: data)
    }
}
