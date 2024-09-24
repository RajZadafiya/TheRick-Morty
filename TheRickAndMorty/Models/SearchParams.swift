//
//  SearchParams.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 09/09/24.
//

import Foundation

enum LiveStatus: String {
    case alive = "alive"
    case dead = "dead"
    case unknown = "unknown"
}

enum Genders: String {
    case female = "female"
    case male = "male"
    case genderless = "genderless"
    case unknown = "unknown"
}

struct SearchParams {
    let name: String
    let status: LiveStatus
    let species: String
    let type: String
    let gender: Genders
    
    init(name: String, status: LiveStatus? = .unknown, species: String? = "", type: String? = "", gender: Genders? = .unknown) {
        self.name = name
        self.status = status ?? .unknown
        self.species = species ?? ""
        self.type = type ?? ""
        self.gender = gender ?? .unknown
    }
    
    static let searchParamsExample = SearchParams(name: "")
    static let filterParamsExample = SearchParams(name: "", status: .unknown, species: "", type: "", gender: .unknown)
}
