//
//  PosterData.swift
//  PosterDetails
//
//  Created by Sanyam Jain on 16/03/19.
//  Copyright © 2019 Sanyam Jain. All rights reserved.
//

import Foundation

struct PosterData {
    let title: String
    let type: String
    let year: String
    let image: String
    
    init(dictionary: PosterJson) {
        self.title = dictionary["Title"] as! String
        self.type = dictionary["Type"] as! String
        self.year = dictionary["Year"] as! String
        self.image = dictionary["Poster"] as! String
    }
}
