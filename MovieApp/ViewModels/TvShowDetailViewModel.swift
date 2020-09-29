//
//  TvShowDetailViewModel.swift
//  MovieApp
//
//  Created by MCT on 30.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

struct TvShowDetailViewModel {
    
    //MARK: - Properties
    
    var tvShowDetail: TvShowDetailModel
    
    //MARK: - LifeCycle
    init(tvShowDetail: TvShowDetailModel) {
        self.tvShowDetail = tvShowDetail
    }
}

//MARK: - Extension

extension TvShowDetailViewModel {
    var tvShowDetailViewModel: TvShowDetailModel {
        return self.tvShowDetail
    }
    
    var tvShowGenre: [Genre] {
        return tvShowDetail.genres
    }
    
    var genreString: String {
        var genresString = String()
        for genre in tvShowGenre {
            genresString = genresString + " " + genre.name
        }
        return genresString
    }
}
