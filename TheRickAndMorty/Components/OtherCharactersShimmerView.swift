//
//  OtherCharactersShimmerView.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 22/09/24.
//

import SwiftUI

struct OtherCharactersShimmerView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(0..<10) { index in
                    CharacterItemShimmerView()
                }
            }
            .listRowBackground(Color.black)
        }
    }
}

#Preview {
    OtherCharactersShimmerView()
}
