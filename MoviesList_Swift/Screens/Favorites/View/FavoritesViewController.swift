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

class FavoritesViewController: UICollectionViewController {
    
    var favoritePresenter : FavoritesPresenter?
    var favoriteArray : [NSManagedObject]?
    var appDelegate: AppDelegate?
    var context : NSManagedObjectContext?

    
    func initPresenter() {
        favoritePresenter = FavoritesPresenter()
        favoritePresenter?.setDelegate(favoritesProtocol: self as FavoritesProtocol)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        initPresenter()
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate!.persistentContainer.viewContext as! NSManagedObjectContext
        
        getFavoriteMovies()
        
       

    }

    func addToFavorite(){
        let movie = FavoriteMovie(context: context!)
        //NSEntityDescription.insertNewObject(forEntityName: "FavoriteMovie", into: context) as! FavoriteMovie
        movie.id_movie = 299534
        movie.original_title = "Avengers: Endgame"
        movie.poster_path = "/or06FN3Dka5tukK1e9sl16pB3iy.jpg"
        movie.overview = "After the devastating events of Avengers: Infinity War, the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos' actions and restore order to the universe once and for all, no matter what consequences may be in store."
        movie.vote_average = 8.5
        movie.release_date = "release_date"
        
        let review = FavoriteReview(context: context!)
        //NSEntityDescription.insertNewObject(forEntityName: "FavoriteReview", into: context) as! FavoriteReview
        review.id_Review = "test about"
        
        let video = FavoriteVideo(context: context!)
        //NSEntityDescription.insertNewObject(forEntityName: "FavoriteVideo", into: context) as! FavoriteVideo
        video.name  = "video name"
        
        movie.addToHasReview(review)
        review.aboutMovie = movie
        movie.addToHasVideo(video)
        video.aboutMovie = movie
        
        do{
            try context?.save()
        }
        catch {
            print("Error")
        }
    }
    
//    func fetchMoviesFromCore() -> [Movie] {
//        moviesArray : [Movie]?
//
//        return moviesArray
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 6 //favoriteArray!.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

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
