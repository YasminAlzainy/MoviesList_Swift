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
        currentMovie = movieObj
        print("Movie Object can be set into Details VC now")
        print(movieObj.original_title!)
        print(movieObj.reviewsArray!)
        print(movieObj.videosArray!)
        
    }
}
