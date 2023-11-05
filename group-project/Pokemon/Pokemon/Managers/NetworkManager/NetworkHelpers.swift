//
//  Helpers.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 3.11.2023.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var header: [String: String]? {get}
    var parameters: [String: Any]? {get}
    func request() -> URLRequest
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum Endpoint {
    case fetchPokemons(page: Int)
    case queryPokemon(name: String)
}

extension Endpoint: EndpointProtocol {

    var baseURL: String {
        return "https://pokeapi.co"
    }

    var path: String {
        switch self {
            case .fetchPokemons: return "/api/v2/pokemon"
            case .queryPokemon(let name): return "/api/v2/pokemon/\(name.lowercased())"
        }
    }

    var method: HTTPMethod {
        return .get
    }

    var header: [String : String]? {
        let header: [String: String] = ["Content-type": "application/json; charset=UTF-8"]
        return header
    }

    var parameters: [String : Any]? {
        return nil
    }

    func request() -> URLRequest {
        guard var components = URLComponents(string: baseURL) else {
            fatalError("URL ERROR")
        }

        if case .fetchPokemons(let page) = self {
            components.queryItems = [URLQueryItem(name: "offset", value: String(describing: page))
            ]
        }

        components.path = path

        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue

        //Add Paramters
        if let parameters {
            do {
                let data = try JSONSerialization.data(withJSONObject: parameters)
                request.httpBody = data
            }catch {
                print(error.localizedDescription)
            }
        }

        if let header = header {
            for (key, value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
}
