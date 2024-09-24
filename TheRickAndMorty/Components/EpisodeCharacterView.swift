//
//  EpisodeCharacterView.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 14/09/24.
//

import SwiftUI

struct EpisodeCharacterDetails: View {
    let character: Character
    
    @EnvironmentObject private var store: Store<AppState>
    
    var body: some View {
        
        let props = map(state: store.state.favoriteState, store: store)

        HStack {
            HStack(alignment: .top) {
                CustomImage(image: character.image)
                    .frame(width: 60,height: 60)
                
                VStack(alignment: .leading) {
                    Text(character.name)
                        .font(.custom(.RobotoBold, size: 20))
                        .foregroundColor(.white)
                        .lineLimit(1)
                    
                    Text(character.species)
                        .font(.custom(.RobotoLight, size: 16))
                        .foregroundStyle(.white.opacity(0.8))
                    
                    Text(character.status)
                        .font(.custom(.RobotoLight, size: 14))
                        .foregroundStyle(.white.opacity(0.8))
                }
                .padding(.leading, 10)
            }
            
            Spacer()
            
            Button(action: {
                props.addFavorite(character)
            }, label: {
                if props.isIncluded(character) {
                    Label("",systemImage: "heart.fill")
                        .labelsHidden()
                        .foregroundColor(.appGreen)
                } else {
                    Label("",systemImage: "heart")
                        .labelsHidden()
                        .foregroundColor(.white)
                }
            })
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}

struct EpisodeCharacterView: View {
    
    @StateObject private var characterDetailsVM = CharacterViewModel(service: APIService())
    
    let url: String
    var body: some View {
        NavigationStack {
            switch characterDetailsVM.characterDetailsState {
            case .loading:
                ForEach(0..<15) {_ in 
                    CharacterSeenInEpisodeShimmerView()
                }
            case .success(let character):
                NavigationLink(destination: CharacterDetails(character: character)) {
                    EpisodeCharacterDetails(character: character)
                }
            case .failed(let error):
                ErrorView(error: error.localizedDescription)
            default:
                ForEach(0..<15) {_ in
                    CharacterSeenInEpisodeShimmerView()
                }
            }
        }.task{
            await characterDetailsVM.getCharacterDetails(characterURL: url)
        }
    }
}

#Preview {
    EpisodeCharacterView(url: APIURL + "/character/2")
}
