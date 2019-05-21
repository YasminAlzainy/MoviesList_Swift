//
//  FavoritesPresenter.swift
//  MoviesList_Swift
//
//  Created by Yasmin Ayman on 13/09/1440 AH.
//  Copyright © 1440 ITI.MAD. All rights reserved.
//

import Foundation
class FavoritesPresenter {
    
    var favoritesProtocol : FavoritesProtocol?
    var favoriteCoreDao : FavoriteCoreDao?
    init() {
        self.favoriteCoreDao = FavoriteCoreDao(presenter: self)
    }
    func setDelegate(favoritesProtocol: FavoritesProtocol) {
        self.favoritesProtocol = favoritesProtocol
    }
    
    func getFavoriteMovies(){
        favoriteCoreDao!.getFavoriteMovies()
    }
    
    func ShowFavoriteMovies(favoriteMovies : [Movie])  {
        favoritesProtocol!.ShowFavoriteMovies(favoriteMovies: favoriteMovies)
    }
}
