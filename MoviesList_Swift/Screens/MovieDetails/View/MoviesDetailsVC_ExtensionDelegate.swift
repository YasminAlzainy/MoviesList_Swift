//
//  MoviesDetailsVC_ExtensionDelegate.swift
//  MoviesList_Swift
//
//  Created by Mai Alaa on 5/19/19.
//  Copyright © 2019 ITI.MAD. All rights reserved.
//

import Foundation
import UIKit

extension MovieDetailsViewController : MoviesDetailsProtocol{
    func deleteFromFavoriteMovies(newMovie: Movie) {
        detailsPresenter.deleteFromFavoriteMovies(newMovie: newMovie)
    }
    
    
    func addToFavoriteMovies(newMovie: Movie) {
        detailsPresenter.addToFavoriteMovies(newMovie: newMovie)
    }
    
    
    func setMovieDetails(movieObj: Movie){
        print("Movie Object can be set into Details VC now")
        titleLabel.text = movieObj.original_title
        releasedateLabel.text = movieObj.release_date
        voteAvgLabel.text = String(format:"%.1f", movieObj.vote_average!)
        
        //image
        //videos
        //trailers
        
        //print(movieObj.original_title!)
        //print(movieObj.reviewsArray!)
        //print(movieObj.videosArray!)
        
    }
}
