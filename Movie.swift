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
    
    init(original_title: String,poster_path: String,overview: String, vote_average:  Double, release_date: String, id: Int){
        self.original_title = original_title
        self.poster_path = poster_path
        self.overview = overview
        self.vote_average = vote_average
        self.release_date = release_date
        self.id = id
    }
    
}
