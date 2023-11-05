//
//  PokemonColorEnum.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 4.11.2023.
//
import UIKit

enum PokemonTypeColor: String {
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case normal
    case grass
    case ground
    case ice
    case poison
    case psychic
    case rock
    case steel
    case water
    case unknown

    var color: UIColor {
        switch self {
            case .dark: return UIColor(hex: "#A7B723")
            case .dragon: return UIColor(hex: "#75574C")
            case .electric: return UIColor(hex: "#7037FF")
            case .fairy: return UIColor(hex: "#F9CF30")
            case .fighting: return UIColor(hex: "#E69EAC")
            case .fire: return UIColor(hex: "#C12239")
            case .flying: return UIColor(hex: "#F57D31")
            case .ghost: return UIColor(hex: "#A891EC")
            case .normal: return UIColor(hex: "#70559B")
            case .grass: return UIColor(hex: "#AAA67F")
            case .ground: return UIColor(hex: "#74CB48")
            case .ice: return UIColor(hex: "#DEC16B")
            case .poison: return UIColor(hex: "#9AD6DF")
            case .psychic: return UIColor(hex: "#A43E9E")
            case .rock: return UIColor(hex: "#FB5584")
            case .steel: return UIColor(hex: "#B69E31")
            case .water: return UIColor(hex: "#B7B9D0")
            case .unknown: return .gray
        }
    }
}

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

func getColor(for type: PokemonTypeColor) -> UIColor {
    return type.color
}
