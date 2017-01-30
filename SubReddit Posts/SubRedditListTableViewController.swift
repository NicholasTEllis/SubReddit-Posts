//
//  SubRedditListTableViewController.swift
//  SubReddit Posts
//
//  Created by Nicholas Ellis on 1/30/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit
import Foundation

class SubRedditListTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBarTextField: UISearchBar!
    
    var subReddits: [Subreddit] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarTextField.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subReddits.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subRedditCell", for: indexPath)
        let subReddit = subReddits[indexPath.row]
        cell.textLabel?.text = subReddit.title
        
        return cell
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBarTextField.text else { return }
        searchBarTextField.resignFirstResponder()
        SubredditController.searchSubreddits(query: query, completion: { (subreddits) in
            self.subReddits = subreddits
        })
    }
}


