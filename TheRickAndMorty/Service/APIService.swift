//
//  APIService.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 07/09/24.
//

import Foundation

class APIService {
    
    enum FetchCharactersError: Error {
        case failed
        case failedToDecode
        case inValidStatusCode
    }
    
    var characters: [Character] = []
    var currentPage: Int = 1
    private var totalPages: Int = 1
    
    func fetchCharacters() async throws -> [Character] {
        
        let url = URL(string: APIURL + CHARACTERS + "/?page=\(currentPage)")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw FetchCharactersError.inValidStatusCode
        }
        
        let decodedResponse = try JSONDecoder().decode(CharactersResult.self,from: data)
        characters.append(contentsOf: decodedResponse.results)
        totalPages = decodedResponse.info.pages
        print("totalPages ->\(totalPages)")
        
        currentPage += 1
        return characters
    }
    
    func loadNextPage(){
        if canLoadMore() {
            currentPage += 1
            print("currentPage ->\(currentPage)")
        }
    }
    
    func canLoadMore() -> Bool {
        return currentPage <= totalPages
    }
    
    func searchFilterCharacters(params: SearchParams) async throws -> [Character] {
        
        var url = APIURL + CHARACTERS + "?name=\(params.name)"
        
        if !params.status.rawValue.isEmpty {
            url += "&status=\(params.status)"
        }
        
        if !params.species.isEmpty {
            url += "&species=\(params.species)"
        }
        
        if !params.type.isEmpty {
            url += "&type=\(params.type)"
        }
        
        if !params.gender.rawValue.isEmpty {
            url += "&gender=\(params.gender)"
        }
        
        guard let url = URL(string: url) else { return [] }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw FetchCharactersError.inValidStatusCode
        }
        
        let decodedResponse = try JSONDecoder().decode(CharactersResult.self, from: data)
        
        return decodedResponse.results
    }
    
    func getEpisodeDetails(episodeId : Int) async throws -> Episode {
        
        guard let url = URL(string: APIURL + EPISODE + "\(episodeId)") else { throw FetchCharactersError.failed }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw FetchCharactersError.inValidStatusCode
        }
        
        let decodedResponse = try JSONDecoder().decode(Episode.self, from: data)
        return decodedResponse
    }
    
    func getCharacterDetails(characterURL: String) async throws -> Character {
        
        guard let url = URL(string: characterURL) else {throw FetchCharactersError.failed}
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw FetchCharactersError.inValidStatusCode
        }
        
        let decodedResponse = try JSONDecoder().decode(Character.self, from: data)
        
        return decodedResponse
    }
}
