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
        Object(id: 1, image: "Image1", name: "Object 1 Name", info: "Image 1 info is typed here", year: "1020 AD", relic_no: "50"),
        Object(id: 2, image: "Image2", name: "Object 2 Name", info: "Image 2 info is typed here", year: "200 AD", relic_no: "30"),
        Object(id: 3, image: "Image3", name: "Object 3 Name", info: "Image 3 info is typed here", year: "1280 AD", relic_no: "25"),
        Object(id: 4, image: "Image4", name: "Object 4 Name", info: "Image 4 info is typed here", year: "1020 AD", relic_no: "50"),
        Object(id: 5, image: "Image5", name: "Object 5 Name", info: "Image 5 info is typed here", year: "200 AD", relic_no: "30"),
        Object(id: 6, image: "Image6", name: "Object 6 Name", info: "Image 6 info is typed here", year: "1280 AD", relic_no: "25"),
        Object(id: 7, image: "Image7", name: "Object 7 Name", info: "Image 7 info is typed here", year: "1020 AD", relic_no: "50"),
        Object(id: 8, image: "Image8", name: "Object 8 Name", info: "Image 8 info is typed here", year: "200 AD", relic_no: "30"),
        Object(id: 9, image: "Image9", name: "Object 9 Name", info: "Image 9 info is typed here", year: "1280 AD", relic_no: "25"),
        Object(id: 10, image: "Image10", name: "Object 10 Name", info: "Image 10 info is typed here", year: "1020 AD", relic_no: "50"),
    ]
    
}
