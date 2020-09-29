//
//  MovieCollectionViewCell.swift
//  MovieApp
//
//  Created by MCT on 28.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var movieVoteLabel: UILabel!
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        image.clipsToBounds = true
    }
}
