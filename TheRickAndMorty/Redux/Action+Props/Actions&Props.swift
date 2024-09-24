//
//  Actions&Props.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 16/09/24.
//

import Foundation

struct FavoriteProps {
    let favorites: [Character]
    let addFavorite: (_ character: Character) -> Void
    let isIncluded: (_ character: Character) -> Bool
}

func map(state: FavouriteState, store: Store<AppState>) -> FavoriteProps {
    FavoriteProps(favorites: state.favorites, addFavorite: {character in
        store.dispatch(action: AddRemoveFavoriteAction(character: character))
    }, isIncluded: {character in !store.state.favoriteState.favorites.filter { $0.id == character.id }.isEmpty } )
}
