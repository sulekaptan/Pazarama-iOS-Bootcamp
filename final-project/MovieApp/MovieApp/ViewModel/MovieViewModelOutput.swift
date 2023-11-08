//
//  MovieViewModelOutput.swift
//  MovieApp
//
//  Created by Şule Kaptan on 8.11.2023.
//

import Foundation

protocol MovieViewModelOutput: AnyObject {
    func updateMovieView(with movieViewModel: MovieViewModel)
}

