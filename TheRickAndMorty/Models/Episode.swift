//
//  Episode.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 12/09/24.
//

import Foundation

struct Episode: Codable, Identifiable {
    let id: Int
    let name: String
    let air_date:String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
    static let example = Episode(id: 28, name: "The Ricklantis Mixup", air_date: "September 10, 2017", episode: "S03E07", characters: [], url: "https://rickandmortyapi.com/api/episode/28", created: "2017-11-10T12:56:36.618Z")
}
