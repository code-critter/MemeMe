//
//  WNBTableViewController.swift
//  Meme_Me
//
//  Created by W N Barker on 1/14/17.
//  Copyright © 2017 W N Barker. All rights reserved.
//

import UIKit

class WNBTableView: UIViewController, UITableViewDelegate, UITableViewDataSource{

    // Model
    
    let favoriteThings = [
        "Raindrops on roses",
        "Whiskers on kittens",
        "Bright copper kettles",
        "Warm woolen mittens",
        "A big blue TARDIS"
    ]
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Mark: Table View Data Source Methods
    
    /**
     * Number of Rows
     */
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //let placeholderCount = 2
        //return placeholderCount
        
        return favoriteThings.count
        
    }
    
    
    /**
     * Cell For Row At Index Path
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteThingCell")! as UITableViewCell
        
        let favoriteThingForRow = self.favoriteThings[indexPath.row]
        
        cell.textLabel?.text = favoriteThingForRow
        
        return cell
    }
    
    //func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    //    let placeholderCell = UITableViewCell()
    //    return placeholderCell
    //}
    
    
}
