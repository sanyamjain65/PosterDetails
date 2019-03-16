//
//  DataStore.swift
//  PosterDetails
//
//  Created by Sanyam Jain on 16/03/19.
//  Copyright © 2019 Sanyam Jain. All rights reserved.
//

import Foundation
import UIKit

final class DataStore {
    static let sharedInstance = DataStore()
    fileprivate init() {}
    
    var posters: [PosterData] = []
    var images: [UIImage] = []
    
    func getPosters(page: Int,completion: @escaping() -> Void) {
        APIClient.getPosterDetails(page: page) { (json) in
            if let search = json?["Search"] as? [PosterJson] {
                for dict in search {
                    let newPoster = PosterData(dictionary: dict)
                    self.posters.append(newPoster)
                }
                completion()
            }
        }
    }
    
    func getPosterImages(page: Int,completion: @escaping() -> Void) {
        getPosters(page: page) {
            for poster in self.posters {
                let url  = URL(string: poster.image)
                let data = try? Data(contentsOf: url!)
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    self.images.append(image!)
                }
            }
            OperationQueue.main.addOperation {
                completion()
            }
        }
    }
}
