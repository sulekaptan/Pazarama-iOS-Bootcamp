//
//  DetailViewModel.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 3.11.2023.
//

import Foundation

protocol DetailViewModelInterface {
    func viewDidLoad()
}

final class DetailViewModel: DetailViewModelInterface {
    
    private weak var view: DetailViewInterface?
    private var manager: PokemonQueryable
    var pokemonResponse: PokemonQueryResponse?
    var typeStrings: [TypeElement] = []
    init(view: DetailViewInterface, manager: PokemonQueryable) {
        self.view = view
        self.manager = manager
    }
    func viewDidLoad() {
        view?.prepare()
    }
    func queryPokemon(pokemonName: String) {
        manager.queryPokemon(pokemonName) {[weak self] response in
            switch response {
                case .success(let success):
                    self?.pokemonResponse = success
                    self?.view?.updateView(pokemonResponse: success)
                    if let abitly = success.types {
                        self?.typeStrings = abitly
                    }
                case .failure(let failure):
                    print(failure)
            }
        }
    }
}
