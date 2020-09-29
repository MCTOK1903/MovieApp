//
//  TvShowDetailViewController.swift
//  MovieApp
//
//  Created by MCT on 30.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit
import SDWebImage

class TvShowDetailViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var TvShowImage: UIImageView!
    @IBOutlet weak var tvShowTitle: UILabel!
    @IBOutlet weak var tvShowGenre: UILabel!
    @IBOutlet weak var tvShowSeason: UILabel!
    @IBOutlet weak var tvShowOverview: UILabel!
    
    
    var tvShowDetailViewModel: TvShowDetailViewModel!
    
    var targetId = Int() {
        didSet {
            createDetailUrl(targetId: targetId)
        }
    }
    
    var detailUrl = String() {
        didSet {
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
    
    func createDetailUrl(targetId:Int){
        detailUrl = UrlConstant.TVSHOW_URL + "\(targetId)" + UrlConstant.API_KEY
    }
    
    func getTargetDetailData(){
        
        NetworkService.shared.service(.get, url: detailUrl, model: TvShowDetailModel.self) { [weak self] (response) in
            guard let self = self else {
                return
            }
            
            switch(response){
            case .success(let tvShowDetailModel):
                self.tvShowDetailViewModel = TvShowDetailViewModel(tvShowDetail: tvShowDetailModel as! TvShowDetailModel)
                DispatchQueue.main.async {
                    self.setupUI()
                }
            case .failure(_):
                break
            }
            
        }
    }
    
    func setupUI(){
        let imageUrl = URL(string: UrlConstant.IMAGE_URL + "\(tvShowDetailViewModel.tvShowDetail.backdropPath)")
        TvShowImage.sd_setImage(with: imageUrl?.absoluteURL)
        tvShowTitle.text =  tvShowDetailViewModel.tvShowDetail.name
        tvShowSeason.text =  "Season:" + String(tvShowDetailViewModel.tvShowDetail.numberOfSeasons)
        tvShowOverview.text = tvShowDetailViewModel.tvShowDetail.overview
        tvShowGenre.text = tvShowDetailViewModel.genreString
    }

}
