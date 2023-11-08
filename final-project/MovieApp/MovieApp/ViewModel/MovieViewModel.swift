//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Şule Kaptan on 8.11.2023.
//

import Foundation

class MovieViewModel {
    private let webService: WebServiceProtocol
    weak var delegate: (MovieViewModelOutput)?
    
    init(webService: WebServiceProtocol) {
        self.webService = webService
    }
    
    func fetchMoviesByQuery(with title: String) {
        webService.fetchMovie(byTitle: title) { result in
            switch result {
            case .success(let movie):
                let movieViewModel = MovieViewModel(webService: movie as! WebServiceProtocol)
                self.delegate?.updateMovieView(with: movieViewModel)
            case .failure(let error):
                print(error)
            }
        }
    }
}

