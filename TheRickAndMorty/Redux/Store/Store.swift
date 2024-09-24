//
//  Store.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 15/09/24.
//

import Foundation

typealias Reducer<State: ReduxState> = (_ state: State,_ action: Action) -> State

protocol ReduxState {}

struct AppState: ReduxState {
    var favoriteState = FavouriteState()
}

struct FavouriteState: ReduxState {
    var favorites: [Character] = StorageService.shared.getEntry() ?? []
}

protocol Action { }

struct AddRemoveFavoriteAction: Action {
    let character: Character
}

class Store<StoreState: ReduxState>: ObservableObject {
    
    var reducer: Reducer<StoreState>
    @Published var state: StoreState
   
    init(reducer: @escaping Reducer<StoreState>, state: StoreState) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action: Action) {
        state = reducer(state, action)
    }
}
