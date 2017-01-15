//
//  WNBCollectionViewController.swift
//  Meme_Me
//
//  Created by W N Barker on 1/14/17.
//  Copyright © 2017 W N Barker. All rights reserved.
//

import UIKit

class WNBCollectionView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
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

    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int{
        
        return favoriteThings.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteThingCell", for IndexPath)! as UICollectionViewCell
        
        let favoriteThingForRow = self.favoriteThings[indexPath.row]
        
        cell.textLabel?.text = favoriteThingForRow
        
        return cell
    }
    
}
