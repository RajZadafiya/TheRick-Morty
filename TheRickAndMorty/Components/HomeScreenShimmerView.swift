//
//  HomeScreenShimmerView.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 22/09/24.
//

import SwiftUI

struct HomeScreenShimmerView: View {
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns) {
                ForEach(1..<15){ index in
                    CharacterItemShimmerView()
                    .padding(.horizontal)
                    .padding(.top, 14.68)
                }
                .frame(width: 180.63,height: 258.63)
                .background(.black)
            }
            .listRowBackground(Color.black)
        }
        .padding(.top,57)
        .background(.black)
    }
}

#Preview {
    HomeScreenShimmerView()
}
