//
//  WebServiceProtocol.swift
//  MovieApp
//
//  Created by Şule Kaptan on 8.11.2023.
//

import Foundation

protocol WebServiceProtocol {
    func fetchMovie(byTitle title: String, completion: @escaping (Result<Movie, Error>) -> Void)
}

