//
//  SplashScreen.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 22/09/24.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Image(.appSplash1)
                .resizable()
                .scaledToFill()
//                .ignoresSafeArea()
//                .frame(minWidth: 0)
//                .edgesIgnoringSafeArea(.all)
//                .frame(maxWidth: 300, maxHeight: 300)
//                .shadow(color: .appGreen, radius: 30)
//                .border(.appGreen, width: 0.5)
//                .cornerRadius(10)
        }
    }
}

#Preview {
    SplashScreen()
}
