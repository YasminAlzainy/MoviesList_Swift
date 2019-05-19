//
//  MovieConnection.swift
//  MoviesList_Swift
//
//  Created by Mai Alaa on 5/16/19.
//  Copyright © 2019 ITI.MAD. All rights reserved.
//

import UIKit
import Alamofire

private let reuseIdentifier = "Cell"
private let genericUrl = "https://api.themoviedb.org/3/discover/movie/"
private let singleMovieUrl = "https://api.themoviedb.org/3/movie/"
private let reviewsUrl = "reviews"
private let vediosUrl = "videos"
private let apiKey = "?api_key=60e665aad4a6ffc1ac2f69d0cd3b9429"
private var moviesUrl : String?
private let basePosterPath = "https://image.tmdb.org/t/p/w185"

class MovieConnection: NSObject {
    
    var recentsPresenter : RecentsPresenter?
    
    init(presenter: RecentsPresenter){
        self.recentsPresenter = presenter
    }
    
    func getMovieDetailsWithAlamoFire(choice: Bool){
        var moviesJsonDict : Dictionary<String,Any>?
        var resultsArr : Array<Dictionary<String,Any>>?
        var movieObjArr : [Movie] = []
        
        if choice == true {
            moviesUrl = "https://api.themoviedb.org/3/discover/movie?sort_by=highest-rated&api_key=60e665aad4a6ffc1ac2f69d0cd3b9429&fbclid=IwAR1BTaNrLM4rukhxDr146FGkybtswQdGpu1nuRt35dYvMLnVZgwUSljD3wE"
            movieObjArr = []
        }
        else{
            moviesUrl = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=60e665aad4a6ffc1ac2f69d0cd3b9429&fbclid=IwAR1BTaNrLM4rukhxDr146FGkybtswQdGpu1nuRt35dYvMLnVZgwUSljD3wE"
            
        }
        
        Alamofire.request(moviesUrl!)
            .responseData { (resData) in
                let jsonStr = String(data: resData.result.value!, encoding: String.Encoding.utf8)!;
                let jsonData = jsonStr.data(using: String.Encoding.utf8)
                
                do{
                    moviesJsonDict = try JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? Dictionary<String,Any>
                    //print(self.moviesJsonDict!)
        
                }
                catch {print("Error in AF ")}
                
                //get results array
                resultsArr = moviesJsonDict!["results"] as? Array<Dictionary<String,Any>>
                //print(self.resultsArr!)
                
                //fill a movie object with data from dict inside the json array
                for dict in resultsArr!{
                    let movieObj : Movie = Movie(original_title: "", poster_path: "", overview: "", vote_average: 0.0, release_date: "", id: 0)
                    movieObj.id = dict["id"] as? Int
                    movieObj.original_title = dict["original_title"] as? String
                    movieObj.overview = dict["overview"] as? String
                    movieObj.poster_path = dict["poster_path"] as? String
                    movieObj.release_date = dict["release_date"] as? String
                    movieObj.vote_average = dict["vote_average"] as? Double
                    //print(self.movieObj.id!)
                    
                    movieObjArr.append(movieObj)
                }
                
                self.sendMovieListToPresenter(movieList: movieObjArr)
                
                for i in 0..<movieObjArr.count{
                    print(movieObjArr[i].original_title!)
                }
        }
    }
    
    func sendMovieListToPresenter(movieList: [Movie]) {
        recentsPresenter?.sendMovieListToView(movieList: movieList)
    }
    
}

