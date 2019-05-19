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
    
    func setDelegate(favoritesProtocol: FavoritesProtocol) {
        self.favoritesProtocol = favoritesProtocol
    }
}
