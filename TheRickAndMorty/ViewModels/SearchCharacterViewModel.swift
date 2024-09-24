//
//  SearchCharacterViewModel.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 09/09/24.
//

import Foundation

@MainActor
class SearchCharacterViewModel: ObservableObject {
    
    enum State {
        case na
        case loading
        case success(searchCharacters: [Character])
        case failure(error: Error)
    }
    
    @Published private(set) var state: State = .na
    
    private var service: APIService
    
    init(service: APIService){
        self.service = service
    }
    
    func getSearchFilterCharacters(params: SearchParams) async {
        self.state = .loading
        
        do {
            let characters = try await service.searchFilterCharacters(params: params)
            self.state = .success(searchCharacters: characters)
        } catch {
            self.state = .failure(error: error)
        }
    }
    
}
