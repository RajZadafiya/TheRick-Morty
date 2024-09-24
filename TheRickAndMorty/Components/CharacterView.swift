//
//  CharacterView.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 07/09/24.
//

import SwiftUI

struct CharacterView: View {
    let character: Character
    
    @EnvironmentObject private var store: Store<AppState>
    
    var body: some View {
        let props = map(state: store.state.favoriteState, store: store)
        VStack {
            CustomImage(image: character.image)
                .frame(width: 156, height: 194.32)
            VStack(alignment: .leading) {
                HStack {
                    Text(character.name)
                        .font(.custom(.RobotoBold,size: 16))
                        .foregroundStyle(.white)
                        .lineSpacing(18.75)
                        .fontWeight(.semibold)
                    Spacer()
                    Button(action: {
                        props.addFavorite(character)
                    }) {
                        if props.isIncluded(character) {
                            Label("", systemImage: "heart.fill")
                                .labelsHidden()
                                .foregroundColor(.appGreen)
                                .frame(alignment: .leading)
                        } else {
                            Label("", systemImage: "heart")
                                .labelsHidden()
                                .foregroundColor(.grayHeart)
                                .frame(alignment: .leading)
                        }
                    }
                    .frame(width: 2)
                }
                Text(character.species)
                    .font(.custom(.RobotoThin,size: 14))
                    .foregroundStyle(.white)
                    .frame(alignment: .leading)
                    .fontWeight(.regular)
            }
            .padding(.horizontal)
            .padding(.top, 14.68)
        }
        .frame(width: 180.63,height: 258.63)
        .background(.black)
//        .onChange(of: props.favorites.count) { count, initCount in
//            guard count >= 0 else {return}
//            StorageService.shared.setEntry(props.favorites)
//        }
    }
}

#Preview {
    CharacterView(character: .example)
}
