//
//  CustomTapBar.swift
//  KNU Museum
//
//  Created by 윤성환 on 2022/05/11.
//


import SwiftUI

struct CustumTapBar: View {
    var body: some View {
        GeometryReader{proxy in
            HStack(spacing:0){
                ForEach(Tap.allCases, id : \.rawValue){tab in
                    Button
                    {
                        withAnimation(.easeInOut(duration: 0.2)){
                        }
                    }label: {
                        Image(systemName: tab.rawValue)
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.blue)
                    }
                    
                }
            }
        }
        .frame(height: 30)
        .padding(.bottom,10)
        .padding([.horizontal,.top])
    }
}

struct CustumTapBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
