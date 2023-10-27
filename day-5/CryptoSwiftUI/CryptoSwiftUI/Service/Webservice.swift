//
//  Webservice.swift
//  CryptoSwiftUI
//
//  Created by Şule Kaptan on 27.10.2023.
//

import Foundation

class Webservice {
    
    //async eklediysen cevabı mutlaka await al
    //datatask escaping kullanır. data async await
    func downloadCurrenciesAsync(url: URL) async throws -> [Crypto]{
        let (data, _) = try await URLSession.shared.data(from: url)
        let currencyList = try? JSONDecoder().decode([Crypto].self, from: data)
        return currencyList ?? []
    }
    
    func downloadCurrencies(url: URL, completion: @escaping (Result<[Crypto], CryptoError>) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.badUrl))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(.serverError))
            }
            
            guard let currencyList = try? JSONDecoder().decode([Crypto].self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(currencyList))
        }.resume()
    }
}

enum CryptoError:Error{
    case badUrl
    case decodingError
    case serverError
}
