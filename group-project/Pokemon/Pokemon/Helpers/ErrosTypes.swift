//
//  ErrosTypes.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 4.11.2023.
//

import Foundation

enum ErrosTypes: String, Error {

    case invalidUrl = "InvalidUrl"
    case noData = "No data"
    case invalidRequest = "Invalid request"
    case generalError = "General Error"
    case parsingError = "Parsing Error"
    case responseError = "Response Error"

}
