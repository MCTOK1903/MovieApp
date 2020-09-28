//
//  MovieCollectionViewCell.swift
//  MovieApp
//
//  Created by MCT on 28.09.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        image.clipsToBounds = true
        
    }
    
    

}
