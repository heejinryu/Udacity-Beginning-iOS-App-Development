//
//  RarityOfItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func rarityOfItems(inventory: [UDItem]) -> [UDItemRarity:Int] {
        var a = 0, b = 0, c = 0, d = 0
        for item in inventory {
            if item.rarity == .Common {
                a += 1
            } else if item.rarity == .Uncommon {
                b += 1
            } else if item.rarity == .Rare {
                c += 1
            } else if item.rarity == .Legendary {
                d += 1
            }
        }
        return [UDItemRarity.Common: a, UDItemRarity.Uncommon: b, UDItemRarity.Rare: c, UDItemRarity.Legendary: d]
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 4"