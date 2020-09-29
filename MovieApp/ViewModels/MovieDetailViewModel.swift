//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by MCT on 29.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

struct MovieDetailViewModel {
    
    //MARK: - Properties
    var movieDetail: MovieDetail
    
    init(movieDetail: MovieDetail) {
        self.movieDetail = movieDetail
    }
}

extension MovieDetailViewModel {
    
    var movieDetailModel: MovieDetail {
        return self.movieDetail
    }
    
}
