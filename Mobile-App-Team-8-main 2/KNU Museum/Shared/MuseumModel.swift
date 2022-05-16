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
    }
    
    
    var data = [
        Object(id: 0, image: "Image1", name: "Object 1 Name", info: "Image 1 info is typed here", year: "1020 AD"),
        Object(id: 1, image: "Image2", name: "Object 2 Name", info: "Image 2 info is typed here", year: "200 AD"),
        Object(id: 2, image: "Image3", name: "Object 3 Name", info: "Image 3 info is typed here", year: "1280 AD")
    ]
    
}
