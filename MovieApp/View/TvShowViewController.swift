//
//  TvShowViewController.swift
//  MovieApp
//
//  Created by MCT on 29.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit
import SDWebImage

class TvShowViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var topRatedTvShowCV: UICollectionView!
    @IBOutlet weak var popularTvShowCV: UICollectionView!
    
    var topRatedTvShowViewModel: TvShowViewModel! {
        didSet {
            topRatedTvShowResult = topRatedTvShowViewModel.resultModel
        }
    }
    
    var popularTvShowViewModel: TvShowViewModel! {
        didSet {
            popularTvShowResult = popularTvShowViewModel.resultModel
        }
    }
    
    var topRatedTvShowResult = [Results]()
    var popularTvShowResult = [Results]()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topRatedTvShowCV.delegate = self
        topRatedTvShowCV.dataSource = self
        
        popularTvShowCV.delegate = self
        popularTvShowCV.dataSource = self
        
        getDataFromApi()
        
    }
    
    
    //MARK: - Func
    func getDataFromApi(){
        
        NetworkService.shared.service(.get, url: UrlConstant.TOP_RATED_TVSHOW_URL, model: TvShow.self) { [weak self] (response) in
            guard let self = self else {
                return
            }
            switch(response) {
            case .success(let tvShowModel):
                self.topRatedTvShowViewModel = TvShowViewModel(tvShow: tvShowModel as! TvShow)
                DispatchQueue.main.async {
                    self.topRatedTvShowCV.reloadData()
                }
            case .failure(_):
                break
            }
        }
        
        NetworkService.shared.service(.get, url: UrlConstant.POPULAR_TVSHOW_URL, model: TvShow.self) { [weak self] (response) in
            guard let self = self else {
                return
            }
            switch(response) {
            case .success(let tvShowModel):
                self.popularTvShowViewModel = TvShowViewModel(tvShow: tvShowModel as! TvShow)
                DispatchQueue.main.async {
                    self.popularTvShowCV.reloadData()
                }
            case .failure(_):
                break
            }
        }
    }
    
}

//MARK: - Extension: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension TvShowViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
        case 0:
            return topRatedTvShowResult.count
        case 1:
            return popularTvShowResult.count
        default:
            return 1
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopRatedaTvShowCell", for: indexPath) as! TopRatedTvShowCollectionViewCell
            let imageUrl = URL(string: UrlConstant.IMAGE_URL + "\(topRatedTvShowResult[indexPath.item].backdropPath)")
            cell.tvShowImage.sd_setImage(with: imageUrl?.absoluteURL)
            cell.tvShowTitle.text = topRatedTvShowResult[indexPath.item].name
            cell.tvShowVote.text = "Popularity:" + String(topRatedTvShowResult[indexPath.item].popularity)
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularTvShowCell", for: indexPath) as! PopularTvSHowCollectionViewCell
            let imageUrl = URL(string: UrlConstant.IMAGE_URL + "\(popularTvShowResult[indexPath.item].backdropPath)")
            cell.tvShowImage.sd_setImage(with: imageUrl?.absoluteURL)
            cell.tvShowTitle.text = popularTvShowResult[indexPath.item].name
            cell.tvShowVote.text = "Popularity:" + String(popularTvShowResult[indexPath.item].popularity)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopRatedaTvShowCell", for: indexPath)
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
