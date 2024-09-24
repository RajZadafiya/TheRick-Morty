//
//  StorageService.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 22/09/24.
//

import Foundation

final class StorageService {
    static let shared = StorageService()
    private let key = "Favourites"
    private var url: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func setEntry(_ favourites: [Character]?, encoder: JSONEncoder = .init()){
        guard let favourites = favourites else { return }
        let path = url.appendingPathComponent(key)
        
        do {
            let encodedEntry = try encoder.encode(favourites)
            try encodedEntry.write(to: path)
            print(#function, favourites.count)
        } catch {
            let error = error as NSError
            
            print(#function, error.localizedDescription)
        }
    }
    
    func getEntry(_ decoder: JSONDecoder = .init()) -> [Character]? {
        var favourites: [Character]? = []
        let path = url.appendingPathComponent(key)
        do {
            let decodedEntry = try Data(contentsOf: path)
            favourites = try decoder.decode([Character].self, from: decodedEntry)
            print(#function, favourites?.count ?? [])
        }catch {
            let error = error as NSError
            print(#function, error.localizedDescription)
        }
        
        return favourites
    }
}
