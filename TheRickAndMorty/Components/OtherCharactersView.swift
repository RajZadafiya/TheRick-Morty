//
//  OtherCharactersView.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 11/09/24.
//

import SwiftUI

struct OtherCharactersView: View {
    
    @StateObject private var otherCharactersVM = CharacterViewModel(service: APIService())
    
    var body: some View {
        NavigationStack {
            VStack {
                switch otherCharactersVM.state {
                case .loading:
                    OtherCharactersShimmerView()
                case .success(let characters):
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(characters) { character in
                                NavigationLink(destination:CharacterDetails(character: character)){
                                    CharacterView(character: character)
                                }
                            }
                        }
                        .listRowBackground(Color.black)
                    }
                case .failed(let error):
                    ErrorView(error: error.localizedDescription)
                default :
                    OtherCharactersShimmerView()
                }
            }
        }
        .task {
            await otherCharactersVM.getCharacters()
        }
    }
}

#Preview {
    OtherCharactersView()
}
