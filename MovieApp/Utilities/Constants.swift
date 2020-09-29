//
//  Constants.swift
//  MovieApp
//
//  Created by MCT on 29.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

class UrlConstant {
    
    //MARK: - KEY
    private static let API_KEY = "?api_key="+"fc6fbc3ee72d36c19e1752a6ee0f6273"
    
    //MARK: - Movie
    private static let MOVIE_URL = "https://api.themoviedb.org/3/movie/"
    static let TOP_RATED_MOVIE = MOVIE_URL + "top_rated" + API_KEY
    static let NOW_PLAYING_MOVIE = MOVIE_URL + "now_playing" + API_KEY
    static let POPULAR_MOVIE =  MOVIE_URL + "popular" + API_KEY
    
    //MARK: - TvShow
    
    //MARK: - Image
    
    static let IMAGE_URL = "https://image.tmdb.org/t/p/w500"
}
