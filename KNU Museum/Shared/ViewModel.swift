//
//  ViewModel.swift
//  KNU Museum
//
//  Created by Sreya Reddy on 15/05/22.
//

import SwiftUI

class ViewModel: ObservableObject {
    typealias Object = MuseumModel.Object
    
    @Published private var model = MuseumModel()
    
    var objects: Array<Object> {
        model.data
    }
    

}


