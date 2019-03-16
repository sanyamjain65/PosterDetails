//
//  DetailsViewController.swift
//  PosterDetails
//
//  Created by Sanyam Jain on 16/03/19.
//  Copyright © 2019 Sanyam Jain. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailType: UILabel!
    @IBOutlet weak var detailYear: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    let store = DataStore.sharedInstance
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let orientationValue = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(orientationValue, forKey: "orientation")
        print("index is \(index)")
        let poster = store.posters[index]
        print("poster in second vc is \(poster)")
        self.detailTitle.text = poster.title
        self.detailType.text = poster.type
        if var yearAgo = Int(poster.year) {
            yearAgo = 2019 - yearAgo
            print("yearAgo is \(yearAgo)")
            self.detailYear.text = String(yearAgo) + " years ago"
        } else {
            self.detailYear.text = poster.year
        }
        self.detailImage.image = store.images[index]
    }
}

