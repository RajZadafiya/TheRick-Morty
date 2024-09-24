//
//  AppReducers.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 16/09/24.
//

import Foundation

func appReducer(_ state: AppState,_ action: Action) -> AppState {
    
    var state = state
    state.favoriteState = favoriteReducer(state.favoriteState, action)
    return state
}
