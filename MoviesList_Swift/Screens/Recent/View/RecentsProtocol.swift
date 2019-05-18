//
//  RecentsProtocol.swift
//  MoviesList_Swift
//
//  Created by Mai Alaa on 5/16/19.
//  Copyright © 2019 ITI.MAD. All rights reserved.
//

import Foundation

protocol RecentsProtocol {
    func showMovies(movieObjectsArray: [Movie])
    func showVideos(videoObjectsArray: [Video] , index: Int)
    func showReviews(reviewsObjectsArray: [Review] , index: Int)
}
