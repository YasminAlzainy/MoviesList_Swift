//
//  RecentViewController.swift
//  MoviesList_Swift
//
//  Created by Yasmin Ayman on 08/09/1440 AH.
//  Copyright © 1440 ITI.MAD. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

private let reuseIdentifier = "Cell"
private let basePosterPath = "https://image.tmdb.org/t/p/w185"

class RecentViewController: UICollectionViewController {
    
    var index : Int = 0
    var movieObjArr : [Movie] = []
    
    var recentsPresenter : RecentsPresenter = RecentsPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recentsPresenter.setDelegate(delegate: (self as RecentsProtocol))
        
        getMoviesList()
        //self.collectionView?.reloadData()
        
    }
    

     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var idStr = String(movieObjArr[index].id!)
        getVideosList(movieId: idStr , index: index)
        getReviewsList(movieId: idStr, index: index)
     }

    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(movieObjArr.count)
        return movieObjArr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RecentCollectionViewCell
        
        // Configure the cell
        let posterUrlString : String = basePosterPath+movieObjArr[indexPath.row].poster_path!
        
        cell.movieImageView.sd_setImage(with: NSURL(string: posterUrlString) as URL?, placeholderImage: UIImage(named:"movie.jpg"))
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        index = indexPath.row
     return true
     }
    
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}


