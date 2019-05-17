//
//  RecentsViewController_ExtensionDelegate.swift
//  MoviesList_Swift
//
//  Created by Mai Alaa on 5/16/19.
//  Copyright © 2019 ITI.MAD. All rights reserved.
//

import Foundation

//implements view prototcol
extension RecentViewController : RecentsProtocol{
    
    func showMovies(movieObjectsArray: [Movie]) {
        self.movieObjArr = movieObjectsArray
        self.collectionView?.reloadData()
    }
    
    func getMoviesList(){
        recentsPresenter.getMovieListFromNS()
    }
    
    
}
