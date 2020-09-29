//
//  MovieCastViewModel.swift
//  MovieApp
//
//  Created by MCT on 29.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

struct MovieCastViewModel {
    
    //MARK: - Properties
    var movieCast: MovieCastModel
    
    //MARK: - LifeCycle
    
    init(movieCast: MovieCastModel) {
        self.movieCast = movieCast
    }
}

//MARK: - Extension
extension MovieCastViewModel {
    
    var movieCastModel: MovieCastModel {
        return self.movieCast
    }
    
    var Cast: [Cast] {
        return self.movieCast.cast
    }
    
}
