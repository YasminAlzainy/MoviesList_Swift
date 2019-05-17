//
//  Review.swift
//  MoviesList_Swift
//
//  Created by Yasmin Ayman on 09/09/1440 AH.
//  Copyright © 1440 ITI.MAD. All rights reserved.
//

import Foundation

class Review {
    var author: String?
    var content: String?
    var id: String?
    var url: String?
    
    init(author: String , content: String , id: String , url: String) {
        self.author = author
        self.content = content
        self.id = id
        self.url = url
    }
}
