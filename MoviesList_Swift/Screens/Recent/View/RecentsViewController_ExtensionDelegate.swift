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
        for i in 0..<movieObjArr.count{
            let idStr = String(movieObjArr[i].id!)
            getVideosList(movieId: idStr , index: index)
            getReviewsList(movieId: idStr, index: index)
        }
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
        RecentViewController.check = RecentViewController.check + 1

        sendMovieToDetailsView(movie: movieObjArr[index])
        detailsVC?.videosTable = videoObjectsArray
        detailsVC?.readVideosArray()
        //sendMovieToDetailsView(movie: movieObjArr[index])
    }
    
    func showReviews(reviewsObjectsArray: [Review] , index: Int) {
        movieObjArr[index].reviewsArray = reviewsObjectsArray
        RecentViewController.check = RecentViewController.check + 1
        sendMovieToDetailsView(movie: movieObjArr[index])
    }
    
    func sendMovieToDetailsView(movie: Movie){
        
//        let video = movieObjArr[index].videosArray![0] as Video
//        print(video.name)
        //detailsVC?.reviewsTable = reviewsObjectsArray
        detailsVC?.readReviewsArray()

        //sendMovieToDetailsView(movie: movieObjArr[index])
    }
    
//    func sendMovieToDetailsView(movie: Movie){
//         let video = movieObjArr[index].videosArray![0] as Video
//         print(video.name)
//        // send the movie to details presenter
//        //detailsPresenter.sendWholeMovieObjectToDetailsVC(movieObj: movie)
////        if  (RecentViewController.check == 2)
////        {
////            self.collectionView?.reloadData()
////            print(movieObjArr[0].videosArray![0].name!)
////            print (movieObjArr[0].reviewsArray![0].author!)
////        }
    

    

}
