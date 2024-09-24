//
//  CharacterViewModel.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 07/09/24.
//

import Foundation

@MainActor
class CharacterViewModel: ObservableObject {
    
    enum State {
        case na
        case loading
        case success(characters: [Character])
        case failed(error: Error)
    }
    
    enum CharacterDetailsState {
        case na
        case loading
        case success(character: Character)
        case failed(error: Error)
    }
    
    @Published private(set) var state: State = .na
    @Published private(set) var characterDetailsState: CharacterDetailsState = .na
    
    @Published var currentPage: Int = 1
    @Published var canLoadMore:() -> Bool
    
    private var service: APIService
    
    init(service: APIService) {
        self.service = service
        self.currentPage = service.currentPage
        self.canLoadMore = service.canLoadMore
    }
    
    func getCharacters() async {
        if currentPage == 1 {
            self.state = .loading
        }
        do {
            let characters = try await service.fetchCharacters()
            self.state = .success(characters: characters)
        } catch {
            self.state = .failed(error: error)
        }
    }
     
    func getCharacterDetails(characterURL: String) async {
        self.characterDetailsState = .loading
        
        do {
            let characterDetails = try await service.getCharacterDetails(characterURL: characterURL)
            self.characterDetailsState = .success(character: characterDetails)
        } catch {
            self.state = .failed(error: error)
        }
    }
}
