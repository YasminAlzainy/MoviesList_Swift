//
//  VedioDao.swift
//  MoviesList_Swift
//
//  Created by Yasmin Ayman on 09/09/1440 AH.
//  Copyright © 1440 ITI.MAD. All rights reserved.
//

import Foundation
import Alamofire

class VedioDao {
    private let singleMovieUrl = "https://api.themoviedb.org/3/movie/"
    private let vediosUrl = "/videos"
    private let apiKey = "?api_key=60e665aad4a6ffc1ac2f69d0cd3b9429"
   // var moviesJsonDict : Dictionary<String,Any>?

    func concatVedioURL(movieId:String) -> String {
        var concatedVedioUrl = singleMovieUrl + movieId + vediosUrl + apiKey
        //print(concatedVedioUrl)
        return concatedVedioUrl
    }
    
    func vediosList(movieId:String){
        var moviesJsonDict : Dictionary<String,Any>?
        Alamofire.request(concatVedioURL(movieId: movieId))
            .responseData { (resData) in
                let jsonStr = String(data: resData.result.value!, encoding: String.Encoding.utf8)!;
                let jsonData = jsonStr.data(using: String.Encoding.utf8)
                do
                {
                    moviesJsonDict = try JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? Dictionary<String,Any>
                    var vedioResults = moviesJsonDict!["results"]! as! Array<Dictionary<String,Any>>
                   
                    self.parseVediosJsonArray(moviesJsonDict: vedioResults)
                }
                catch {print("Error in AF ")}
        }
    }
    
    func parseVediosJsonArray( moviesJsonDict: Array<Dictionary<String,Any>> ) -> Array<Vedio> {
        var vedioArray = Array<Vedio>()
        
        for i in 0..<moviesJsonDict.count{
            
        var vedioJson = moviesJsonDict[i] as! Dictionary<String ,Any>
        var id = vedioJson["id"] as! String
        var iso_639_1 = vedioJson["iso_639_1"] as! String
        var iso_3166_1 = vedioJson["iso_3166_1"] as! String
        var key = vedioJson["key"] as! String
        var name =  vedioJson["name"] as! String
        var site = vedioJson["site"] as! String
        var size = vedioJson["size"] as! Int
        var type =  vedioJson["type"] as! String
        
        var vedio = Vedio.init(id: id , iso_639_1:iso_639_1 , iso_3166_1:iso_3166_1 , key: key , name:name, site: site , size: size , type: type)
        vedioArray.append(vedio)
        }
        
        return vedioArray
    }

}
