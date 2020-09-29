//
//  MovieCastModel.swift
//  MovieApp
//
//  Created by MCT on 29.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

// MARK: - MovieCastModel
struct MovieCastModel: Codable {
    let cast: [Cast]

    enum CodingKeys: String, CodingKey {
        case cast = "cast"
    }
}

// MARK: - Cast
struct Cast: Codable {
    let castID: Int
    let character: String
    let creditID: String
    let gender: Int
    let id: Int
    let name: String
    let order: Int
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case castID = "cast_id"
        case character = "character"
        case creditID = "credit_id"
        case gender = "gender"
        case id = "id"
        case name = "name"
        case order = "order"
        case profilePath = "profile_path"
    }
}
