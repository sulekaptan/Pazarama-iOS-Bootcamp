//
//  NetworkManager.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 3.11.2023.
//

import Foundation


protocol PokemonsFethable {
    func fetchPokemons(page: Int,completion: @escaping (Result<PokemonsResponse, ErrosTypes>) -> Void)
}

protocol PokemonQueryable {
    func queryPokemon(_ withName: String,completion: @escaping (Result<PokemonQueryResponse, ErrosTypes>) -> Void)
}


final class NetworkManager {
    var coreManager: CoreNetworkManagerInterface

    init(coreManager: CoreNetworkManagerInterface = CoreNetworkManager()) {
        self.coreManager = coreManager
    }
}

extension NetworkManager: PokemonsFethable {

    func fetchPokemons(page: Int,completion: @escaping (Result<PokemonsResponse, ErrosTypes>) -> Void) {
        let endPoint = Endpoint.fetchPokemons(page: page)
        coreManager.request(endPoint, completion: completion)
    }
}

extension NetworkManager: PokemonQueryable {
    func queryPokemon(_ withName: String,completion: @escaping (Result<PokemonQueryResponse, ErrosTypes>) -> Void) {
        let endpoint = Endpoint.queryPokemon(name: "\(withName)")
        coreManager.request(endpoint, completion: completion)
    }
}
