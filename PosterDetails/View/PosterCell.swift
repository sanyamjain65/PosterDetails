//
//  PosterCell.swift
//  PosterDetails
//
//  Created by Sanyam Jain on 16/03/19.
//  Copyright © 2019 Sanyam Jain. All rights reserved.
//

import Foundation
import UIKit

class PosterCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    func displayContent(title: String, type: String, year: String, image: UIImage) {
        self.title.text = title
        self.type.text = type
        if var yearAgo = Int(year) {
            yearAgo = 2019 - yearAgo
            print("yearAgo is \(yearAgo)")
            self.year.text = String(yearAgo) + " years ago"
        } else {
            self.year.text = year
        }
        self.posterImage.image = image
    }
}
