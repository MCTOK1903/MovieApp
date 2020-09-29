//
//  MovieDetailModel.swift
//  MovieApp
//
//  Created by MCT on 29.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//
import Foundation

// MARK: - MovieDetail
struct MovieDetail: Codable {
    //let adult: Bool
    let backdropPath: String
    //let budget: Int
   // let homepage: String
    let id: Int
    //let imdbID: String
  //  let originalLanguage: String
    //let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
   // let releaseDate: String
    //let revenue: Int
    //let runtime: Int
   // let status: String
   // let tagline: String
    let title: String
   // let video: Bool
    //let voteAverage: Int
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        //case adult = "adult"
        case backdropPath = "backdrop_path"
        //case budget = "budget"
       // case homepage = "homepage"
        case id = "id"
        //case imdbID = "imdb_id"
        //case originalLanguage = "original_language"
        //case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        //case releaseDate = "release_date"
        //case revenue = "revenue"
        //case runtime = "runtime"
       //case status = "status"
        //case tagline = "tagline"
        case title = "title"
        //case video = "video"
        //case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
