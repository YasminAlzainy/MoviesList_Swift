//
//  Vedio.swift
//  MoviesList_Swift
//
//  Created by Yasmin Ayman on 09/09/1440 AH.
//  Copyright © 1440 ITI.MAD. All rights reserved.
//

import Foundation

class Video : NSObject {
    
    var id : String?
    var iso_639_1 : String?
    var iso_3166_1 : String?
    var key : String?
    var name : String?
    var site : String?
    var size : Int?
    var type : String?
    
    init(id:String , iso_639_1:String ,iso_3166_1:String , key:String ,name:String , site:String , size :Int , type:String   ) {
        self.id = id
        self.iso_639_1 = iso_639_1
        self.iso_3166_1 = iso_3166_1
        self.key = key
        self.name = name
        self.site = site
        self.size = size
        self.type = type
    }

//     func printVedio() -> String{
//        var str = "id: " + id! + "\n iso_639_1: " + iso_639_1! + " \n iso_3166_1: " + iso_3166_1 +
//        "\n key: " + key + "\n name: " + name + "\n site: " + site! + "\n size: " + size + "\n type: " + type;
//        print(str)
//        return str
//    
//    }

}
