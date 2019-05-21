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
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteMovie")
        do{
            try context!.save()
            
            let newMovieList = try context!.fetch(fetchRequest) as! [NSManagedObject];
            let arr = newMovieList ;
            print(newMovieList.count)
        }
        catch{}
    }
    
    func getFavoriteMovies() {
   
        favoritePresenter!.getFavoriteMovies()
    }
    
    func showFaoriteMovies() {
        
    }
    
    
}
