//
//  Movie.swift
//  MoviesList_Swift
//
//  Created by Esraa Hassan on 5/14/19.
//  Copyright © 2019 ITI.MAD. All rights reserved.
//

import UIKit

class Movie: NSObject {
    var original_title : String?
    var poster_path : String?
    var overview : String?
    var vote_average : Double?
    var release_date : String?
    var id : Int? //Movie id from json
}
