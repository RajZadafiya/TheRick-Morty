//
//  TheRickAndMortyApp.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 07/09/24.
//

import SwiftUI

@main

struct TheRickAndMortyApp: App {
    var body: some Scene {
        
        let store = Store(reducer: appReducer, state: AppState())
        
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
