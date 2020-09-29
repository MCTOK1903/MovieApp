//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by MCT on 29.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    var movieDetailViewModel: MovieDetailViewModel!
    
    var targetId = Int(){
        didSet{
            createDetailUrl(targetId: targetId)
        }
    }
    
    var detailUrl = String() {
        didSet{
            print(detailUrl)
            getTargetDetailData()
        }
    }
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.tabBar.isHidden = true
    }
    
    //MARK: - Func
    
    func getTargetDetailData(){
        
        NetworkService.shared.service(.get, url: detailUrl, model: MovieDetail.self) { [weak self] (response) in
            guard let self = self else {
                return
            }
            
            switch(response){
            case .success(let movieDetailModel):
                self.movieDetailViewModel = MovieDetailViewModel(movieDetail: movieDetailModel as! MovieDetail)
                DispatchQueue.main.async {
                    self.setupUI()
                }
            case .failure(_):
                break
            }
            
        }
    }
    
    func createDetailUrl(targetId:Int){
        detailUrl = UrlConstant.MOVIE_URL + "\(targetId)" + UrlConstant.API_KEY
    }
    
    func setupUI(){
        let imageUrl = URL(string: UrlConstant.IMAGE_URL + "\(movieDetailViewModel.movieDetailModel.backdropPath)")
        movieImage.sd_setImage(with: imageUrl?.absoluteURL)
        movieTitle.text = movieDetailViewModel.movieDetailModel.title
        overviewLabel.text = movieDetailViewModel.movieDetailModel.overview
    }
    
    

}
