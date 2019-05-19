//
//  RecentsViewController_ExtensionDelegate.swift
//  MoviesList_Swift
//
//  Created by Mai Alaa on 5/16/19.
//  Copyright © 2019 ITI.MAD. All rights reserved.
//

import Foundation

//implements view prototcol
extension RecentViewController : RecentsProtocol{
    func showMovies(movieObjectsArray: [Movie]) {
        self.movieObjArr = movieObjectsArray
        self.collectionView?.reloadData()
    }
    
//    func getMoviesList(){
//        recentsPresenter.getMovieListFromNS()
//    }
    
    func getMoviesList(userChoice: Bool){
        recentsPresenter.getMovieListFromNS(userChoice: userChoice)
    }
    
    
    
    func getVideosList(movieId:String , index: Int) {
        recentsPresenter.getVideosListFromNS(movieId: movieId , index:index )
    }
    
    func getReviewsList(movieId:String , index: Int) {
        recentsPresenter.getReviewsListFromNS(movieId: movieId , index:index )
    }
    

    func showVideos(videoObjectsArray: [Video] , index: Int) {
        movieObjArr[index].videosArray = videoObjectsArray
        sendMovieToDetailsView(movie: movieObjArr[index])
    }
    
    func showReviews(reviewsObjectsArray: [Review] , index: Int) {
        movieObjArr[index].reviewsArray = reviewsObjectsArray
        sendMovieToDetailsView(movie: movieObjArr[index])
    }
    
    func sendMovieToDetailsView(movie: Movie){
        // send the movie to details presenter
    }

}
