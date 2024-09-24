//
//  CustomReducers.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 16/09/24.
//

import Foundation

func favoriteReducer(_ state: FavouriteState,_ action: Action) -> FavouriteState {
   
   var state = state
   switch action {
   case let action as AddRemoveFavoriteAction:
       let isIncluded = state.favorites.filter {$0.id == action.character.id}
       if !isIncluded.isEmpty {
           state.favorites.removeAll(where: { $0.id == action.character.id })
       } else {
           state.favorites.append(action.character)
       }
       print("state.favorites -> \(state.favorites.count)")
       break
   default:
       break
   }
   StorageService.shared.setEntry(state.favorites)
   return state
}
