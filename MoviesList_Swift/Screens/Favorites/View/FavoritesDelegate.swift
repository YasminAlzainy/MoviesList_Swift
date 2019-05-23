//
//  FavoritesViewDelegate.swift
//  MoviesList_Swift
//
//  Created by Yasmin Ayman on 13/09/1440 AH.
//  Copyright © 1440 ITI.MAD. All rights reserved.
//

import Foundation
import CoreData

extension FavoritesViewController : FavoritesProtocol
{
    func ShowFavoriteMovies(favoriteMovies: [Movie]) {
            print(favoriteMovies.count)
            favoriteCollectionArray = favoriteMovies
            self.collectionView?.reloadData()
    }
    
    func getFavoriteMovies() {
        favoritePresenter!.getFavoriteMovies()
    }
    
}
