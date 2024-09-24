//
//  EpisodeView.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 11/09/24.
//

import SwiftUI

struct EpisodeView: View {
    let index: Int
    var body: some View {
        VStack{
            Text("Episode \(index)")
        }
        .frame(width: 88, height: 25)
        .background(.episodeBG)
    }
}

#Preview {
    EpisodeView(index : 0)
}
