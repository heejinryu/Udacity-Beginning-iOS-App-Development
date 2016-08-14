//
//  PlanetData.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//
import Foundation

extension Hero {
    
    func planetData(dataFile: String) -> String {
        let dataFileURL = NSBundle.mainBundle().URLForResource(dataFile, withExtension: "json")!
        let rawPlantDataJSON = NSData(contentsOfURL: dataFileURL)!
        
        var planetDataDictionary: [[String:AnyObject]]!
        do {
            planetDataDictionary = try! NSJSONSerialization.JSONObjectWithData(rawPlantDataJSON, options: NSJSONReadingOptions()) as! [[String:AnyObject]]
        }
    
        var mostValuablePlanet:String = ""
        var value:Int = 0
        for planet in planetDataDictionary {
            if let name = planet["Name"] as? String {
                if let legendary = planet["LegendaryItemsDetected"] as? Int, rare = planet["RareItemsDetected"] as? Int, uncommon = planet["UncommonItemsDetected"] as? Int, common = planet["CommonItemsDetected"] as? Int {
                    let newValue:Int = legendary * 4 + rare * 3 + uncommon * 2 + common * 1
                        if newValue > value {
                        value = newValue
                        mostValuablePlanet = name
                    }
                }
            }
        }
        
        return mostValuablePlanet
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 7"