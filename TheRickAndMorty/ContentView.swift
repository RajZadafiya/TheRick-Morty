//
//  ContentView.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 07/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplashScreen = true
    @State private var scale = 1.2
    
    var body: some View {
        VStack {
            if showSplashScreen {
                SplashScreen()
                    .transition(.scale)
                    .animation(.interactiveSpring)
                    .scaleEffect(scale)
                    .onAppear{
                        withAnimation(.easeIn(duration: 0.7)) {
                            self.scale = 1.0
                        }
                    }
            }else {
                CharactersList()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                withAnimation {
                    showSplashScreen = false
                }
            }
        }
    }
}

#Preview {
    let store = Store(reducer: favoriteReducer, state: FavouriteState())
    return ContentView()
        .environmentObject(store)
}
