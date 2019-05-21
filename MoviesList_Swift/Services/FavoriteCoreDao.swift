//
//  FavoriteCoreDao.swift
//  MoviesList_Swift
//
//  Created by Yasmin Ayman on 14/09/1440 AH.
//  Copyright © 1440 ITI.MAD. All rights reserved.
//

import Foundation
class FavoriteCoreDao {
    var favoritePresenter : FavoritesPresenter?
    
    init(presenter: FavoritesPresenter){
        self.favoritePresenter = presenter
    }
    
    func getFavoriteMovies() {
        var favoriteMovies : [Movie]?
        
        favoritePresenter!.ShowFavoriteMovies(favoriteMovies: favoriteMovies!)
    }
    
    
}
