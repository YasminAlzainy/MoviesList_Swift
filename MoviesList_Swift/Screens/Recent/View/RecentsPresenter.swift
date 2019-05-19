//
//  RecentsPresenter.swift
//  MoviesList_Swift
//
//  Created by Mai Alaa on 5/16/19.
//  Copyright © 2019 ITI.MAD. All rights reserved.
//

import Foundation

class RecentsPresenter{
    var videoDao : VideoDao?
    var reviewDao : ReviewsDao?
    var recentsDelegate : RecentsProtocol?
    var movieConnection : MovieConnection?
    var movieList : [Movie] = []
    
    init(){
        self.movieConnection = MovieConnection(presenter: self)
        self.videoDao = VideoDao(presenter: self)
        self.reviewDao = ReviewsDao(presenter: self)

    }
    
    func setDelegate(delegate: RecentsProtocol){
        self.recentsDelegate = delegate
    }
    
//    func getMovieListFromNS(){
//        movieConnection?.getMovieDetailsWithAlamoFire(choice: Bool)
//    }
    
    func getMovieListFromNS(userChoice: Bool){
        movieConnection?.getMovieDetailsWithAlamoFire(choice: userChoice)
    }
    
    func sendMovieListToView(movieList: [Movie]){
        recentsDelegate?.showMovies(movieObjectsArray: movieList)
    }
    
    func getVideosListFromNS(movieId:String , index: Int){
        videoDao?.videosList(movieId: movieId, index: index)
    }
    
    func getReviewsListFromNS(movieId:String , index: Int){
        reviewDao?.reviewsList(movieId: movieId, Index: index)
    }
    
    func sendVideosListToView(vediosArray: Array<Video> , index: Int)
    {
        recentsDelegate?.showVideos(videoObjectsArray: vediosArray, index: index)
    }
    
    func sendReviewsListToView(reviewsArray: Array<Review> , index: Int)
    {
        recentsDelegate?.showReviews(reviewsObjectsArray: reviewsArray, index: index)
    }
}
