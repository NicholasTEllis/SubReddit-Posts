//
//  SubRedditListTableViewController.swift
//  SubReddit Posts
//
//  Created by Nicholas Ellis on 1/30/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit

class SubRedditListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     

     
     return cell
     }
}
