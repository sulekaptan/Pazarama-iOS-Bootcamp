//
//  WebService.swift
//  MovieApp
//
//  Created by Şule Kaptan on 8.11.2023.
//

import Foundation

class WebService : WebServiceProtocol {
    private var apiKey = "9ac7803"
    private var baseURL = "http://www.omdbapi.com"
    
    func fetchMovie(byTitle title: String, completion: @escaping (Result<Movie, Error>) -> Void) {
        let urlString = "\(baseURL)?apikey=\(apiKey)&t=\(title)"
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                } else if let data = data {
                    do {
                        let movie = try JSONDecoder().decode(Movie.self, from: data)
                        completion(.success(movie))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }.resume()
        }
    }
}

