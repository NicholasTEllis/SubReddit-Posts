//
//  Subreddit.swift
//  SubReddit Posts
//
//  Created by Nicholas Ellis on 1/30/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import Foundation

class Subreddit {
    
    static let kTitle = "display_name"
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    convenience init?(jsonDictionary: [String : Any]) {
        guard let title = jsonDictionary[Subreddit.kTitle] as? String else {
        return nil
        }
        self.init(title: title)
    }
}
