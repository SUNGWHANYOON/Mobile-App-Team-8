//
//  MuseumModel.swift
//  KNU Museum
//
//  Created by Sreya Reddy on 15/05/22.
//

import Foundation

struct MuseumModel {
    
    struct Object: Identifiable {
        var id: Int
        var image: String
        var name: String
        var info: String
        var year: String
        var relic_no: String
    }
    
    static var information = ["abc", "def"]
    
    var data = [
        Object(id: 0, image: "Image1", name: "Object 1 Name", info: information[0], year: "1020 AD", relic_no: "50"),
        Object(id: 1, image: "Image2", name: "Object 2 Name", info: information[1], year: "200 AD", relic_no: "30"),
        Object(id: 2, image: "Image3", name: "Object 3 Name", info: "Image 3 info is typed here", year: "1280 AD", relic_no: "25")
    ]
    
    

}
