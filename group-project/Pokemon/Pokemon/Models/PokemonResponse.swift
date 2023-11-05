//
//  PokemonResponse.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 3.11.2023.
//

import Foundation

// MARK: - PokemonsResponse
struct PokemonsResponse: Codable, Hashable {
    let count: Int?
    let next, previous: String?
    let results: [Pokemon]?
}

// MARK: - Result
struct Pokemon: Codable, Hashable {
    let name: String?
    let url: String?
}
