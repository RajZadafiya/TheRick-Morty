//
//  Favourites.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 14/09/24.
//

import SwiftUI

struct Favourites: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject private var store: Store<AppState>
    
    var body: some View {
        NavigationView {
            VStack {
                if store.state.favoriteState.favorites.isEmpty {
                    VStack {
                        Text("No favorite characters found!")
                            .foregroundStyle(.gray.opacity(0.8))
                            .font(.custom(.RobotoBold, size: 24))
                    }
                } else {
                    ScrollView{
                        LazyVGrid(columns: columns) {
                            ForEach(store.state.favoriteState.favorites) { character in
                                NavigationLink(destination:CharacterDetails(character: character)){
                                    CharacterView(character: character)
                                }
                            }
                            .listRowBackground(Color.black)
                        }
                        .padding(.top,57)
                        .background(.black)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Text("Favorites")
                .foregroundStyle(.appGreen)
                .fontWeight(.semibold)
                .font(.custom(.RobotoThin, size: 23)),
            trailing:
                Button(action: {
                    dismiss()
                }, label: {
                    Label("",systemImage: "xmark")
                        .labelsHidden()
                })
        )
        .tint(.white)
    }
}

#Preview {
    Favourites()
}
