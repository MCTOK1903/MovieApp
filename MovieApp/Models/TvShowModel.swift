//
//  TvShow.swift
//  MovieApp
//
//  Created by MCT on 29.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

// MARK: - TvShow
struct TvShow: Codable {
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

// MARK: - Result
struct Result: Codable {
    let posterPath: String
    let popularity: Double
    let id: Int
    let backdropPath: String
    let voteAverage: Double
    let overview: String
    let firstAirDate: String
    let originCountry: [String]
    let genreIDS: [Int]
    let originalLanguage: String
    let voteCount: Int
    let name: String
    let originalName: String

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case popularity = "popularity"
        case id = "id"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case overview = "overview"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
        case genreIDS = "genre_ids"
        case originalLanguage = "original_language"
        case voteCount = "vote_count"
        case name = "name"
        case originalName = "original_name"
    }
}
