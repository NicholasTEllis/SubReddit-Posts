//
//  SubredditController.swift
//  SubReddit Posts
//
//  Created by Nicholas Ellis on 1/30/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import Foundation

class SubredditController {
    
    static let json = ".json"
    static let baseURL = "https://www.reddit.com/subreddits/search" + "\(json)"
    
    static func searchSubreddits(query: String, completion: @escaping ([Subreddit]) -> Void) {
        let urlParameters = ["q" : query]
        
        guard let url = URL(string: baseURL) else {
            completion([])
            return
        }
        
        NSLog("\(url)")
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            guard let data = data, let response = String(data: data, encoding: .utf8) else {
                NSLog("There was a problem with the data")
                print("\(url)")
                completion([])
                return
            }
            
            guard let responseDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String : Any] else { completion([]); return }
            
            guard let resultsDictionary = responseDictionary["data"] as? [String : Any],
                let childenDictionary = resultsDictionary["children"] as? [[String : Any]] else {
                    NSLog("We didn't parse the data, \(response)")
                    completion([])
                    return
            }
            
            let subRedditResultsArray = childenDictionary.flatMap { $0["data"] as? [String : Any] }
            let subReddits = subRedditResultsArray.flatMap { Subreddit.init(jsonDictionary: $0) }
            completion(subReddits)
    }
}
}
