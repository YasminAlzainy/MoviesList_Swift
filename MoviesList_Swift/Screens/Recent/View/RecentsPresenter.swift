//
//  RecentsPresenter.swift
//  MoviesList_Swift
//
//  Created by Mai Alaa on 5/16/19.
//  Copyright © 2019 ITI.MAD. All rights reserved.
//

import Foundation

class RecentsPresenter{
    var recentsDelegate : RecentsProtocol?
    var movieConnection : MovieConnection?
    var movieList : [Movie] = []
    
    init(){
        self.movieConnection = MovieConnection(presenter: self)
    }
    
    func setDelegate(delegate: RecentsProtocol){
        self.recentsDelegate = delegate
    }
    
    func getMovieListFromNS(){
        movieConnection?.getMovieDetailsWithAlamoFire()
    }
    
    func sendMovieListToView(movieList: [Movie]){
        recentsDelegate?.showMovies(movieObjectsArray: movieList)
    }
}
