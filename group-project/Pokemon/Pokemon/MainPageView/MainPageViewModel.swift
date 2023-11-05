//
//  MainPageViewModel.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 3.11.2023.
//

import Foundation

protocol MainPageViewModelInterface {
    func viewDidLoad()
}

final class MainPageViewModel: MainPageViewModelInterface {
    
    private weak var view: MainPageViewInterface?
    var manager: (PokemonsFethable & PokemonQueryable)
    var poke: [Pokemon] = []
    var listingPokemonCount = 0

    init(view: MainPageViewInterface, manager: (PokemonsFethable & PokemonQueryable)) {
        self.view = view
        self.manager = manager
    }
    func viewDidLoad() {
        view?.prepare()
    }

    func fetchPokemons() {
        manager.fetchPokemons(page: listingPokemonCount) {[weak self] response in
            switch response {
                case .success(let success):
                    if let results = success.results {
                        self?.poke.append(contentsOf: results)
                    }
                    self?.view?.updateData()
                    self?.listingPokemonCount += 20
                case .failure(let failure):
                    print(failure)
            }
        }
    }

    func queryPokemon(pokemonName: String) {
        manager.queryPokemon(pokemonName) {[weak self] response in
            switch response {
                case .success(let success):
                    if !(success.id == nil)  {
                        self?.poke = [Pokemon.init(name: pokemonName, url: "https://pokeapi.co/api/v2/pokemon/\(String(describing: success.id))/")]
                    }
                    self?.view?.updateData()
                case .failure(let failure):
                    print(failure)
            }
        }
    }



}
