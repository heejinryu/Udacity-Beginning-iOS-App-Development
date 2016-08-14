//
//  BannedItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation

extension Hero {
    
    func bannedItems(dataFile: String) -> [Int] {
        let dataFileURL = NSBundle.mainBundle().URLForResource(dataFile, withExtension: "plist")!
        let dataFileArray = NSArray(contentsOfURL: dataFileURL)!
        var banned = [Int]()
        for item in dataFileArray {
            if let name = item["Name"] as? String where (name.lowercaseString.rangeOfString("laser") != nil) {
                if let data = item["HistoricalData"] as? [String:AnyObject] {
                    if let age = data["CarbonAge"] as? Int where age < 30 {
                        banned.append(item["ItemID"] as! Int)
                    }
                }
            }
        }
        return banned
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 6