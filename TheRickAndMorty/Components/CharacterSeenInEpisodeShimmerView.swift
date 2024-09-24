//
//  CharacterSeenInEpisodeShimmerView.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 22/09/24.
//

import SwiftUI

struct CharacterSeenInEpisodeShimmerView: View {
    private let colors: [Color] =  [.gray.opacity(0.5), .white.opacity(0.5)]
    var body: some View {
        HStack {
            HStack(alignment: .top) {
                Text("")
                    .frame(width: 60,height: 60)
                    .shimmerEffect(isActive: true,colors: colors)
                
                VStack(alignment: .leading) {
                    Text("")
                        .frame(width: 150)
                        .shimmerEffect(isActive: true,colors: colors)
                    
                    Text("")
                        .frame(width: 100)
                        .shimmerEffect(isActive: true,colors: colors)
                        .padding(.top,5)
                    
                    Text("")
                        .frame(width: 80)
                        .shimmerEffect(isActive: true,colors: colors)
                        .padding(.top,5)
                }
                .padding(.leading, 10)
            }
            
            Spacer()
            
            Label("",systemImage: "heart")
                .labelsHidden()
                .foregroundColor(.gray.opacity(0.5))
                    .shimmerEffect(isActive: true,colors: colors)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}

#Preview {
    CharacterSeenInEpisodeShimmerView()
}
