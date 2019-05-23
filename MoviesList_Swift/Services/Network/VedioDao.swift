//
//  VedioDao.swift
//  MoviesList_Swift
//
//  Created by Yasmin Ayman on 09/09/1440 AH.
//  Copyright © 1440 ITI.MAD. All rights reserved.
//

import Foundation
import Alamofire

class VideoDao {
    private let singleMovieUrl = "https://api.themoviedb.org/3/movie/"
    private let videosUrl = "/videos"
    private let apiKey = "?api_key=60e665aad4a6ffc1ac2f69d0cd3b9429"
   
    var recentsPresenter : RecentsPresenter?
    
    init(presenter: RecentsPresenter){
        self.recentsPresenter = presenter
    }

    func allViedeos(movies: Array<Movie>) {
        for i in 0..<movies.count
        {
            videosList(movieId: movies[i].id as! String , index:i )
        }
        //recentsPresenter.
    }
    
    func concatVedioURL(movieId:String) -> String {
        let concatedVedioUrl = singleMovieUrl + movieId + videosUrl + apiKey
        return concatedVedioUrl
    }
    
    func videosList(movieId:String , index: Int){
        var movieJsonDict : Dictionary<String,Any>?
        Alamofire.request(concatVedioURL(movieId: movieId))
            .responseData { (resData) in
                let jsonStr = String(data: resData.result.value!, encoding: String.Encoding.utf8)!;
                let jsonData = jsonStr.data(using: String.Encoding.utf8)
                do
                {
                    movieJsonDict = try JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? Dictionary<String,Any>
                    let videoResults = movieJsonDict!["results"]! as! Array<Dictionary<String,Any>>
                   
                   self.parseVideosJsonArray(videoResults: videoResults, index: index)
                }
                catch {print("Error in AF ")}
        }
    }
    
    func parseVideosJsonArray( videoResults: Array<Dictionary<String,Any>> , index: Int) {
        var videosArray = Array<Video>()
        
        for i in 0..<videoResults.count{
            
            var videoJson = videoResults[i]
            let id = videoJson["id"] as! String
            let iso_639_1 = videoJson["iso_639_1"] as! String
            let iso_3166_1 = videoJson["iso_3166_1"] as! String
            let key = videoJson["key"] as! String
            let name =  videoJson["name"] as! String
            let site = videoJson["site"] as! String
            let size = videoJson["size"] as! Int
            let type =  videoJson["type"] as! String
        
            let vedio = Video.init(id: id , iso_639_1:iso_639_1 , iso_3166_1:iso_3166_1 , key: key , name:name, site: site , size: size , type: type)
            videosArray.append(vedio)
        }
        if (videosArray.count == 0)
        {
            let vedio = Video.init(id: "d" , iso_639_1:"" , iso_3166_1:"" , key: "" , name:"", site: "" , size: 0 , type: "")
            videosArray.append(vedio)
        }
        self.sendVedioListToPresenter(vedioArray: videosArray, index: index)
    }

    func sendVedioListToPresenter(vedioArray: Array<Video> , index: Int) {
        recentsPresenter?.sendVideosListToView(vediosArray: vedioArray, index: index)
    }
}
