//
//  MoviesDetailsPresenter.swift
//  MoviesList_Swift
//
//  Created by Mai Alaa on 5/19/19.
//  Copyright © 2019 ITI.MAD. All rights reserved.
//

import Foundation

class MoviesDetailsPresenter{
    var favoritesDao : FavoriteCoreDao?
    
    var recentsPresenter : RecentsPresenter?
    var detailsDelegate : MoviesDetailsProtocol?
    var recentsDelegate : RecentsProtocol?
    
    init() {
        favoritesDao = FavoriteCoreDao(detailsPresenter: self)
    }
    
//    init() {
//        recentsPresenter?.setDelegate(delegate: self as! RecentsProtocol)
//    }
//
//    init(presenter: RecentsPresenter) {
//        self.recentsPresenter = presenter
//    }
    
    func setDelegate(delegate : MoviesDetailsProtocol){
        self.detailsDelegate = delegate
    }
    
    
    func sendWholeMovieObjectToDetailsVC(movieObj : Movie){
        if detailsDelegate == nil {
            print("Details Delegate is NIL")
        }else{
            print("Details Delegate not nil")
        }
        detailsDelegate?.setMovieDetails(movieObj: movieObj)
    }
    
    func addToFavoriteMovies(newMovie: Movie){
        favoritesDao?.addToFavoriteMovies(newMovie: newMovie)
    }
    
    func deleteFromFavoriteMovies(newMovie: Movie){
        favoritesDao?.deleteFromFavoriteMovies(newMovie: newMovie)
    }
    
}
