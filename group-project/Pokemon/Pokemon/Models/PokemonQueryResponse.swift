//
//  PokemonQueryResponse.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 3.11.2023.
//

import Foundation

// MARK: - PokemonQueryResponse
struct PokemonQueryResponse: Codable {
    let abilities: [Ability]?
    let baseExperience: Int?
    let forms: [Species]?
    let height: Int?
    let id: Int?
    let isDefault: Bool?
    let moves: [Move]?
    let name: String?
    let order: Int?
    let species: Species?
    let stats: [Stat]?
    let types: [TypeElement]?
    let weight: Int?

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case height
        case id
        case isDefault = "is_default"
        case name, order, moves
        case species, stats, types, weight
    }
}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species?
    let isHidden: Bool?
    let slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}
// MARK: - Move
struct Move: Codable {
    let move: Species?

    enum CodingKeys: String, CodingKey {
        case move
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String?
    let url: String?
}
// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int?
    let stat: Species?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int?
    let type: Species?
}
