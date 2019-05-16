//
//  ReviewsDao.swift
//  MoviesList_Swift
//
//  Created by Yasmin Ayman on 09/09/1440 AH.
//  Copyright © 1440 ITI.MAD. All rights reserved.
//

import Foundation
import Alamofire

class ReviewsDao {
    private let singleMovieUrl = "https://api.themoviedb.org/3/movie/"
    private let reviewsUrl = "/reviews"
    private let apiKey = "?api_key=60e665aad4a6ffc1ac2f69d0cd3b9429"
    var moviesJsonDict : Dictionary<String,Any>?

    func concatReviewURL(movieId:String) -> String {
        var concatedReviewUrl = singleMovieUrl + movieId + reviewsUrl + apiKey
        print(concatedReviewUrl)
        return concatedReviewUrl
    }
    
    func reviewsList(movieId:String) -> Dictionary<String,Any> {
        var reviews = Array<Review>()
        var reviewsUrl = concatReviewURL(movieId: movieId)
    
        Alamofire.request(concatReviewURL(movieId: "299534"))
            .responseData { (resData) in
                let jsonStr = String(data: resData.result.value!, encoding: String.Encoding.utf8)!;
                let jsonData = jsonStr.data(using: String.Encoding.utf8)
                do
                {
                    self.moviesJsonDict = try JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? Dictionary<String,Any>
                    print(self.moviesJsonDict!)
                }
                catch {print("Error in AF ")}
        }
    
        return moviesJsonDict!
    }
}
