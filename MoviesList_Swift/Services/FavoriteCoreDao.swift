//
//  FavoriteCoreDao.swift
//  MoviesList_Swift
//
//  Created by Yasmin Ayman on 14/09/1440 AH.
//  Copyright © 1440 ITI.MAD. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class FavoriteCoreDao {
    var favoritePresenter : FavoritesPresenter?
    var detailsPresenter : MoviesDetailsPresenter?
    
    init(presenter: FavoritesPresenter){
        self.favoritePresenter = presenter
    }
    
    init(detailsPresenter : MoviesDetailsPresenter) {
        self.detailsPresenter = detailsPresenter
    }
    
    func getFavoriteMovies() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        var fetchedMovies : [FavoriteMovie]?
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteMovie")
        do
        {
            fetchedMovies = try context.fetch(fetchRequest) as! [FavoriteMovie]
            
            let favoriteMovies = managedObjectArrayToMoviesArray(fetchedMovies: fetchedMovies!)
            
            favoritePresenter!.ShowFavoriteMovies(favoriteMovies: favoriteMovies)
        } catch{
            fatalError("Faild fetching movies :  \(error)")
        }
    }
    
    func managedObjectArrayToMoviesArray(fetchedMovies: [FavoriteMovie]) -> [Movie] {
        var favoriteMovies  = Array<Movie>()
        
        for fetchedMovie in fetchedMovies {
            
            let movieObj : Movie = Movie(original_title: "", poster_path: "", overview: "", vote_average: 0.0, release_date: "", id: 0)
            movieObj.id = fetchedMovie.id_movie as? Double
            movieObj.original_title = fetchedMovie.original_title
            movieObj.overview = fetchedMovie.overview
            movieObj.poster_path = fetchedMovie.poster_path
            movieObj.release_date = fetchedMovie.release_date
            movieObj.vote_average = fetchedMovie.vote_average
            
            var reviews = fetchedMovie.hasReview?.allObjects as! [FavoriteReview]
            for fetchedReview in reviews
            {
                let review = Review(author: "", content: "", id: "", url: "")
                review.author = fetchedReview.author
                review.content = fetchedReview.content
                review.id = fetchedReview.id_Review
                review.url = fetchedReview.url
                
                movieObj.reviewsArray?.append(review)
            }
            
            var videos = fetchedMovie.hasVideo?.allObjects as! [FavoriteVideo]
            for fetchedVideo in videos{
                let video = Video(id: "", iso_639_1: "", iso_3166_1: "", key: "", name: "", site: "", size: 0, type: "")
                video.id = fetchedVideo.id_video
                video.iso_3166_1 = fetchedVideo.iso_3166_1
                video.iso_639_1 = fetchedVideo.iso_639_1
                video.key = fetchedVideo.key
                video.name = fetchedVideo.name
                video.site = fetchedVideo.site
                video.size = Int(fetchedVideo.size!)
                
                movieObj.videosArray?.append(video)
            }
            
            favoriteMovies.append(movieObj)
        }
        
        return favoriteMovies
    }
    
    func addToFavoriteMovies(newMovie: Movie){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteMovie")
        let myPredicate = NSPredicate(format: "id_movie==\( newMovie.id!)")
        fetchRequest.predicate = myPredicate
        do{
            if(try context.fetch(fetchRequest).capacity == 0)
            {
                let movie = FavoriteMovie(context: context)
                //NSEntityDescription.insertNewObject(forEntityName: "FavoriteMovie", into: context) as! FavoriteMovie
                movie.id_movie = newMovie.id!
                movie.original_title = newMovie.original_title
                movie.poster_path = newMovie.poster_path
                movie.overview = newMovie.overview
                movie.vote_average = newMovie.vote_average!
                movie.release_date = newMovie.release_date
                
                for newreview in newMovie.reviewsArray!
                {
                    let review = FavoriteReview(context: context)
                    //NSEntityDescription.insertNewObject(forEntityName: "FavoriteReview", into: context) as! FavoriteReview
                    
                    review.id_Review = newreview.id
                    review.author = newreview.author
                    review.content = newreview.content
                    review.url = newreview.url
                    
                    movie.addToHasReview(review)
                    review.aboutMovie = movie
                }
                
                for newVideo in newMovie.videosArray!
                {
                    let video = FavoriteVideo(context: context)
                    //NSEntityDescription.insertNewObject(forEntityName: "FavoriteVideo", into: context) as! FavoriteVideo
                    video.name  = newVideo.name
                    video.id_video = newVideo.id
                    video.iso_3166_1 = newVideo.iso_3166_1
                    video.iso_639_1 = newVideo.iso_639_1
                    video.key = newVideo.key
                    video.site = newVideo.site
                    //   video.size = newVideo.size as! NSDecimalNumber
                    
                    movie.addToHasVideo(video)
                    video.aboutMovie = movie
                }
                
                do{
                    try context.save()
                }
                catch {
                    print("Error")
                }
                
                
            }
        }
            
        catch
        {
            print("Not deleted!")
        }
        
        
    }
    
    func deleteFromFavoriteMovies(newMovie: Movie){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteMovie")
        let myPredicate = NSPredicate(format: "id_movie==\( newMovie.id!)")
        fetchRequest.predicate = myPredicate
        
       
        do{
            if(try context.fetch(fetchRequest).capacity != 0)
            {
                let deletedObj = try context.fetch(fetchRequest)[0] as! NSManagedObject
                context.delete(deletedObj)
            }
            }
           
        catch
        {
            print("Not deleted!")
        }
        
    }

}
