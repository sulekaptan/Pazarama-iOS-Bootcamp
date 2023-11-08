//
//  Movie.swift
//  MovieApp
//
//  Created by Şule Kaptan on 7.11.2023.
//

import Foundation

struct Movie: Codable {
    let title, year: String
    let runtime, genre, director, writer: String
    let actors, plot: String
    let poster: String
    let imdbRating, imdbID: String
}
