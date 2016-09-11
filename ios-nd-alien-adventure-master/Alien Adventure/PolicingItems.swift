//
//  PolicingItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func policingItems(inventory: [UDItem], policingFilter: UDItem throws -> Void) -> [UDPolicingError:Int] {
        var a = 0, b = 0, c = 0
        for i in inventory {
            if i.name.lowercaseString.containsString("laser") {
                a += 1
            } else if i.historicalData["PlanetOfOrigin"] as! String == "Cunia" {
                b += 1
            } else if i.baseValue < 10 {
                c += 1
            }
        }
        return [UDPolicingError.NameContainsLaser: a, UDPolicingError.ItemFromCunia: b, UDPolicingError.ValueLessThan10: c]
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 1"