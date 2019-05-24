//
//  FavoritesViewController.swift
//  MoviesList_Swift
//
//  Created by Yasmin Ayman on 08/09/1440 AH.
//  Copyright © 1440 ITI.MAD. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "FavCell"
private let basePosterPath = "https://image.tmdb.org/t/p/w185"

class FavoritesViewController: UICollectionViewController {
    
    var favoritePresenter : FavoritesPresenter?
    var favoriteCollectionArray = Array<Movie>()
    var appDelegate: AppDelegate?
    var context : NSManagedObjectContext?

    var index = 0
    
    func initPresenter() {
        favoritePresenter = FavoritesPresenter()
        favoritePresenter?.setDelegate(favoritesProtocol: self as FavoritesProtocol)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPresenter()
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate!.persistentContainer.viewContext as! NSManagedObjectContext
        
        getFavoriteMovies()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var detailsView = segue.destination as! MovieDetailsViewController
        detailsView.videosTable = favoriteCollectionArray[index].videosArray!
        detailsView.reviewsTable = favoriteCollectionArray[index].reviewsArray!
        detailsView.currentMovie = favoriteCollectionArray[index]
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return favoriteCollectionArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FavoritesCollectionViewCell

        cell.favoriteMovieImageView.image = UIImage(named: "movie.jpg")
        if favoriteCollectionArray[indexPath.row].poster_path == nil{
            cell.favoriteMovieImageView.image = UIImage(named: "movie.jpg")
        }
        else{
            // Configure the cell
            let posterUrlString : String = basePosterPath +  favoriteCollectionArray[indexPath.row].poster_path!
            print(posterUrlString)
            cell.favoriteMovieImageView.sd_setImage(with: NSURL(string: posterUrlString) as URL?, placeholderImage: UIImage(named:"movie.jpg"))
        }
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
