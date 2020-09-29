//
//  MovieViewController.swift
//  MovieApp
//
//  Created by MCT on 28.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

   //MARK: - Properties
    @IBOutlet weak var nowPlayingCV: UICollectionView!
    @IBOutlet weak var topRatedCV: UICollectionView!
    @IBOutlet weak var popularMoviesCV: UICollectionView!
    
    var nowPlayingMovieViewModel: MovieViewModel! {
        didSet {
            nowPlayingMovieResult = nowPlayingMovieViewModel.resultModel
        }
    }
    
    var topRatedMovieViewModel: MovieViewModel! {
        didSet {
            topRatedMovieReult = topRatedMovieViewModel.resultModel
        }
    }
    
    var popularMovieViewModel: MovieViewModel! {
        didSet {
            popularMovieResult = popularMovieViewModel.resultModel
        }
    }
    
    var nowPlayingMovieResult = [Result]()
    var topRatedMovieReult = [Result]()
    var popularMovieResult = [Result]()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularMoviesCV.dataSource = self
        popularMoviesCV.delegate = self
        
        nowPlayingCV.dataSource = self
        nowPlayingCV.delegate = self
        
        topRatedCV.dataSource = self
        topRatedCV.delegate = self
        
        getDataFromApi()
    }

    
    //MARK: - func
    func getDataFromApi(){
        
        NetworkService.shared.service(.get, url: UrlConstant.NOW_PLAYING_MOVIE, model: Movie.self, detailID: nil) { [weak self] (response) in
            guard let self = self else {
                return
            }
            switch(response) {
            case .success(let movieModel):
                self.nowPlayingMovieViewModel = MovieViewModel(movie: movieModel as! Movie)
                DispatchQueue.main.async {
                    self.nowPlayingCV.reloadData()
                }
            case .failure(_):
                break
            }
        }
        
        NetworkService.shared.service(.get, url: UrlConstant.TOP_RATED_MOVIE, model: Movie.self, detailID: nil) { [weak self] (response) in
            guard let self = self else {
                return
            }
            switch(response) {
            case .success(let movieModel):
                self.topRatedMovieViewModel = MovieViewModel(movie: movieModel as! Movie)
                DispatchQueue.main.async {
                    self.topRatedCV.reloadData()
                }
            case .failure(_):
                break
            }
        }
        
        NetworkService.shared.service(.get, url: UrlConstant.POPULAR_MOVIE, model: Movie.self, detailID: nil) { [weak self] (response) in
            guard let self = self else {
                return
            }
            switch(response) {
            case .success(let movieModel):
                self.popularMovieViewModel = MovieViewModel(movie: movieModel as! Movie)
                DispatchQueue.main.async {
                    self.popularMoviesCV.reloadData()
                }
            case .failure(_):
                break
            }
        }
    }
}

//MARK: - Extensiom: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension MovieViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
        case 0:
            return nowPlayingMovieResult.count
        case 1:
            return topRatedMovieReult.count
        case 2:
            return popularMovieResult.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCollectionViewCell
            cell.movieNameLabel.text = nowPlayingMovieResult[indexPath.item].title
            cell.movieVoteLabel.text = "Vote: " + String(nowPlayingMovieResult[indexPath.item].voteCount)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopRatedMovieCell", for: indexPath) as! MovieCollectionViewCell
            cell.movieNameLabel.text = topRatedMovieReult[indexPath.item].title
            cell.movieVoteLabel.text = "Vote: " + String(topRatedMovieReult[indexPath.item].voteCount)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularMovieCell", for: indexPath) as! MovieCollectionViewCell
            cell.movieNameLabel.text = popularMovieResult[indexPath.item].title
            cell.movieVoteLabel.text = "Vote: " + String(popularMovieResult[indexPath.item].voteCount)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCollectionViewCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let columns: CGFloat = 1
        let collectionViewHeight = collectionView.bounds.height
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let sectionInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let adjustedHeight = collectionViewHeight - spaceBetweenCells - sectionInsets
        let width: CGFloat = floor(adjustedHeight / columns)
        let height: CGFloat = width / 1.5
        return CGSize(width: width, height: height)
    }
}
