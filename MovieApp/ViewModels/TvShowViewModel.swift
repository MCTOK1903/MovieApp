//
//  TvShowViewModel.swift
//  MovieApp
//
//  Created by MCT on 29.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import Foundation

struct TvShowViewModel {
    
    //MARK: - Properties
    var tvShow: TvShow
    
    //MARK: - LifeCycle
    init(tvShow: TvShow) {
        self.tvShow = tvShow
    }
}

//MARK: - Extension

extension TvShowViewModel {
    
    var tvShowModel: TvShow {
        return self.tvShow
    }
    
    var resultModel: [Results] {
        return self.tvShow.results
    }
}
