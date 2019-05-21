//
//  MovieCoreDao.swift
//  MoviesList_Swift
//
//  Created by Yasmin Ayman on 14/09/1440 AH.
//  Copyright © 1440 ITI.MAD. All rights reserved.
//

import Foundation
class MovieCoreDao {
    var recentsPresenter : RecentsPresenter?
    
    init(presenter: RecentsPresenter){
        self.recentsPresenter = presenter
    }
}
