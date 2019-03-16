//
//  ViewController.swift
//  PosterDetails
//
//  Created by Sanyam Jain on 16/03/19.
//  Copyright © 2019 Sanyam Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    let store = DataStore.sharedInstance
    var page: Int = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isPagingEnabled = true
        store.getPosterImages(page: page) {
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.posters.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let poster = store.posters[indexPath.row]
        cell.displayContent(title: poster.title, type: poster.type, year: poster.year, image: store.images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let poster = store.posters[indexPath.row]
        print("poster is \(poster)")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC: DetailsViewController = (storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController)!
        detailVC.index = indexPath.row
        detailVC.navigationItem.backBarButtonItem?.title = "back"
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        page = page + 1
        store.getPosterImages(page: page) {
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width
        return CGSize(width: width, height: 98)
    }

    public override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape,
            let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = view.frame.height
            layout.itemSize = CGSize(width: width , height: 98)
            layout.invalidateLayout()
        } else if UIDevice.current.orientation.isPortrait,
            let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = view.frame.width
            layout.itemSize = CGSize(width: width, height: 160)
            layout.invalidateLayout()
        }
    }


}

