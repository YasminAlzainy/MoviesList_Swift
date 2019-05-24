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

    var recentsPresenter : RecentsPresenter?
    
    init(presenter: RecentsPresenter){
        self.recentsPresenter = presenter
    }
    
    func concatReviewURL(movieId:String) -> String {
        let concatedReviewUrl = singleMovieUrl + movieId + reviewsUrl + apiKey
        print(concatedReviewUrl)
        return concatedReviewUrl
    }
    
//    func allReviews(movies: Array<Movie>) {
//        for i in 0..<movies.count
//        {
//            reviewsList(movieId: movies[i].id as! String , Index:i )
//        }
//        //callback
//    }
    
    func reviewsList(movieId:String , Index: Int) {
        var movieJsonDict : Dictionary<String,Any>?
        Alamofire.request(concatReviewURL(movieId: movieId))
            .responseData { (resData) in
                let jsonStr = String(data: resData.result.value!, encoding: String.Encoding.utf8)!;
                let jsonData = jsonStr.data(using: String.Encoding.utf8)
                do
                {
                    movieJsonDict = try JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? Dictionary<String,Any>
                    let reviewResults = movieJsonDict!["results"]! as! Array<Dictionary<String,Any>>
                    print(reviewResults)
                    self.parseReviewssJsonArray(reviewJsonDict: reviewResults , index: Index)
                }
                catch {print("Error in AF ")}
        }
    }
    
    func parseReviewssJsonArray( reviewJsonDict: Array<Dictionary<String,Any>> , index: Int) {
        var reviewsArray = Array<Review>()
        
        for i in 0..<reviewJsonDict.count{
            
            var reviewJson = reviewJsonDict[i]
            let author = reviewJson["author"] as! String
            let content = reviewJson["content"] as! String
            let id = reviewJson["id"] as! String
            let url = reviewJson["url"] as! String
            
            let review = Review(author: author, content: content, id: id, url: url);
            reviewsArray.append(review)
        }
        if (reviewsArray.count == 0)
        {
            
            let review = Review(author: "", content: "", id: "", url: "");
            reviewsArray.append(review)
        }
        self.sendReviewsListToPresenter(reviewsList: reviewsArray, index: index)
}
    
    func sendReviewsListToPresenter(reviewsList: [Review] , index: Int) {
        recentsPresenter?.sendReviewsListToView(reviewsArray: reviewsList, index: index)
    }
}
