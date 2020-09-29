//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by MCT on 29.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

struct MovieViewModel {
    
    //MARK: - Properties
    var movie: Movie
    
    //MARK: - LifeCycle
    init(movie: Movie) {
        self.movie = movie
    }
}

//MARK: - Extension

extension MovieViewModel {
    var movieModel: Movie  {
        return self.movie
    }
}
