//
//  ImageManager.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 4.11.2023.
//

import UIKit

final class ImageManager {
   static func extractNumberFromURL(_ urlString: String) -> Int? {
        guard let url = URL(string: urlString) else {
            return nil
        }

        if let lastPathComponent = url.lastPathComponent.components(separatedBy: "/").last {
            let components = lastPathComponent.components(separatedBy: CharacterSet.decimalDigits.inverted)
            if let number = components.compactMap({ Int($0) }).first {
                return number
            }
        }
        return nil
    }

    static func createPokemonImageURL(number: Int) -> String {
        let paddedNumber = String(format: "%03d", number)
        let urlString = "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(paddedNumber).png"
        return urlString
    }
}
