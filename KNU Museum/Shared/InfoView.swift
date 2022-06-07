//
//  InfoView.swift
//  KNU Museum
//
//  Created by 위재원 on 2022/05/27.
//

import SwiftUI
import MapKit

struct InfoView: View {
    
    var english: Bool
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.88866600507044, longitude: 128.6138348995155),
        span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015))
    
    var body: some View {
        NavigationView{
        GeometryReader { geometry in
            VStack {
                if english {
                    Text("Information")
                        .font(.title)
                        .bold()
                } else {
                    Text("정보")
                        .font(.title)
                        .bold()
                }
                
            
                ScrollView(.vertical, showsIndicators: false) {
                    Image("Museum")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .opacity(0.8)
                        .overlay {
                            Circle().stroke(.white, lineWidth: 2)
                        }
                        .shadow(color: .gray, radius: 7)
                        .padding()
                        
                    Divider()
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            if english {
                                Text("Open")
                                    .font(.subheadline)
                                    .bold()
                                Spacer()
                                Text("Mon ~ Sat")
                                    .font(.subheadline)
                            } else {
                                Text("개관일")
                                    .font(.subheadline)
                                    .bold()
                                Spacer()
                                Text("월요일 ~ 토요일")
                                    .font(.subheadline)
                            }

                        }.padding()
                        HStack(alignment: .top) {
                            if english {
                                Text("Closed")
                                    .foregroundColor(.red)
                                    .font(.subheadline)
                                    .bold()
                                Spacer()
                                Text("Sun, Public Holidays")
                                    .font(.subheadline)
                            } else {
                                Text("휴관일")
                                    .foregroundColor(.red)
                                    .font(.subheadline)
                                    .bold()
                                Spacer()
                                Text("일요일, 공휴일")
                                    .font(.subheadline)
                            }
                            
                        }.padding()
                        HStack(alignment: .top) {
                            if english {
                                Text("Opening Hours")
                                    .font(.subheadline)
                                    .bold()
                                Spacer()
                                Text("10:00 ~ 17:00(Last Entry: 16:30)")
                                    .font(.subheadline)
                            } else {
                                Text("개관시간")
                                    .font(.subheadline)
                                    .bold()
                                Spacer()
                                Text("10:00 ~ 17:00(16시 30분까지 입장)")
                                    .font(.subheadline)
                            }
                            
                        }.padding()
                        HStack(alignment: .top) {
                            if english {
                                Text("Admission Fee")
                                    .font(.subheadline)
                                    .bold()
                                Spacer()
                                Text("Free")
                                    .font(.subheadline)
                            } else {
                                Text("입장료")
                                    .font(.subheadline)
                                    .bold()
                                Spacer()
                                Text("무료")
                                    .font(.subheadline)
                            }
                        }.padding()
                        HStack(alignment: .top) {
                            if english {
                                Text("Contact")
                                    .font(.subheadline)
                                    .bold()
                            } else {
                                Text("연락처")
                                    .font(.subheadline)
                                    .bold()
                            }
                            Spacer()
                            Text("053-950-6537")
                                .font(.subheadline)
                        }.padding()
                        HStack(alignment: .top) {
                            if english {
                                Text("Address")
                                    .font(.subheadline)
                                    .bold()
                            } else {
                                Text("주소")
                                    .font(.subheadline)
                                    .bold()
                            }
                            Spacer()
                            VStack(alignment: .trailing){
                                if english{
                                    Text("80 Daehak-ro, Buk-gu, Daegu")
                                        .font(.subheadline)
                                } else {
                                    Text("대구광역시 북구 대학로 80")
                                        .font(.subheadline)
                                }
                                
                                Spacer(minLength: 20)
                               
                            }
                        }.padding()
                        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                            .frame(width: geometry.size.width, height: geometry.size.width)
                    }
                    Spacer()
                }
               
            }
            .background(LinearGradient(gradient: .init(colors: [Color("Color2"), Color("Color4")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        }
    }

    }
}

//struct info {
//    let infos = [
//        museumInfo(CampusId: 1, OpeningDay: "월요일 ~ 토요일", ClosedDay: "일요일, 공휴일", OpeningHour: "10:00 ~ 17:00(16시 30분까지 입장)", AddmissionFee: "무료", Address: "대구광역시 북구 대학로 80", CallingNumber: "053-950-6537"),
//        museumInfo(CampusId: 2, OpeningDay: "월요일 ~ 금요일", ClosedDay: "토요일, 일요일, 공휴일", OpeningHour: "10:00 ~ 17:00(16시 30분까지 입장)", AddmissionFee: "무료", Address: "경상북도 상주시 경상대로 2559", CallingNumber: "054-530-1138")
//    ]
//
//}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(english: false)
    }
}
