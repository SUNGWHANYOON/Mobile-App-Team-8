//
//  KNU_MuseumApp.swift
//  Shared
//
//  Created by Sreya Reddy on 09/05/22.
//

import SwiftUI

@main
struct KNU_MuseumApp: App {
    let data = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(objectContent: data)
        }
    }
}
