//
//  Predict_Button.swift
//  KNU Museum
//
//  Created by anusha on 2022/05/27.
//


import SwiftUI

struct imagepred : View{
    //var AIView : AIview
    @Environment(\.presentationMode) var present
   // @State private var val = 0
    //@State private var information = ""
   var datainfo : ViewModel
    var id_value : String
   
    var body: some View{
        self.display()
        return GeometryReader{Geometry in
        VStack{
            ZStack {
                HStack {
                    //Text("prediction")
                    Button {
                        // pop the view when the back button is pressed
                        self.present.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    Spacer()
                    Spacer()
                }
            }
                ForEach(datainfo.objects ){ d in
                    
                    if d.id == Int(id_value){
                      
                        Image( d.image)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 2)
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(30)
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.2))
                           
                               // self.Boolshowlibrary = true
                           
                            Text("\(d.info)")
                                    .font(.title)
                                    .foregroundColor(.white.opacity(0.8))
                            
                        }
                        .padding(.horizontal)
                    }
                }
            
        }
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color2"), Color("Color4")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
       
       
    }
    func display(){
       // print("started")
        let k = datainfo.objects
        let  indexvalue  = Int(id_value)
        
        for i in k{
           // if indexvalue == i.id{
            //print("id",i)
            //    print("again")
               // val = i.id
                //information = i.info
                
            //}
            
        }
             
      //  print("\(datainfo.objects)")
      //  print("ended")
    }
}

