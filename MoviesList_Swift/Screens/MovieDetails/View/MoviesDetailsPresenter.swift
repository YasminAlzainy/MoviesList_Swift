//
//  MoviesDetailsPresenter.swift
//  MoviesList_Swift
//
//  Created by Mai Alaa on 5/19/19.
//  Copyright © 2019 ITI.MAD. All rights reserved.
//

import Foundation

class MoviesDetailsPresenter{
    
    var recentsPresenter : RecentsPresenter?
    var detailsDelegate : MoviesDetailsProtocol?
    var recentsDelegate : RecentsProtocol?
    
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
    
     
    
}
