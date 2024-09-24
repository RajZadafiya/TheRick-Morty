//
//  CharacterItemShimmerView.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 22/09/24.
//

import SwiftUI

struct CharacterItemShimmerView: View {
    var body: some View {
        VStack {
            Text("")
                .frame(width: 156, height: 194.32)
                .shimmerEffect(isActive: true)
            VStack(alignment: .leading) {
                HStack {
                    Text("")
                        .frame(width: 100)
                        .shimmerEffect(isActive: true)
                    Spacer()
                    Label("", systemImage: "heart.fill")
                        .labelsHidden()
                        .shimmerEffect(isActive: true)
                }
            }
            Text("")
                .frame(width: 100)
                .shimmerEffect(isActive: true)
        }
    }
}

#Preview {
    CharacterItemShimmerView()
}
