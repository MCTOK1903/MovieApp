//
//  TvShowDetailModel.swift
//  MovieApp
//
//  Created by MCT on 30.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

// MARK: - TvShowDetailModel
struct TvShowDetailModel: Codable {
    let backdropPath: String
    let episodeRunTime: [Int]
    let firstAirDate: String
    let genres: [Genre]
    let homepage: String
    let id: Int
    let inProduction: Bool
    let lastAirDate: String
    let name: String
    let numberOfEpisodes: Int
    let numberOfSeasons: Int
    let originalLanguage: String
    let originalName: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let status: String
    let type: String
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case inProduction = "in_production"
        case lastAirDate = "last_air_date"
        case name = "name"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case status = "status"
        case type = "type"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}
