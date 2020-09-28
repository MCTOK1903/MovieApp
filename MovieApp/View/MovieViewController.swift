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
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularMoviesCV.dataSource = self
        popularMoviesCV.delegate = self
        
        nowPlayingCV.dataSource = self
        nowPlayingCV.delegate = self
        
        topRatedCV.dataSource = self
        topRatedCV.delegate = self
    }

}

//MARK: - Extensiom: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension MovieViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCollectionViewCell
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            cell.image.clipsToBounds = true
        }
        return cell
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
