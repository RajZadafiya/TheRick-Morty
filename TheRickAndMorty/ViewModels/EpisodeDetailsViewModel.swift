//
//  EpisodeDetailsViewModel.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 12/09/24.
//

import Foundation

@MainActor
class EpisodeDetailsViewModel: ObservableObject {
    
    enum State {
        case na
        case loading
        case success(episodeDetails: Episode)
        case failer(error: Error)
    }
    
    @Published private(set) var state: State = .na
    
    private let service: APIService
    
    init(service: APIService){
        self.service = service
    }
    
    func getEpisodeDetails(episodeId: Int) async {
        self.state = .loading
        
        do {
            let episodeDetails = try await service.getEpisodeDetails(episodeId: episodeId)
            self.state = .success(episodeDetails: episodeDetails)
        } catch {
            self.state = .failer(error: error)
        }
        
    }
}
