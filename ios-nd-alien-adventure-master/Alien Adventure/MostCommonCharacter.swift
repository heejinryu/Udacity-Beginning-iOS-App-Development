//
//  MostCommonCharacter.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func mostCommonCharacter(inventory: [UDItem]) -> Character? {
        var names: String = ""
        for i in inventory {
            names = names + i.name.lowercaseString
        }
        var counts:[Character:Int] = [:]
        
        for character in names.characters {
            counts[character] = (counts[character] ?? 0) + 1
        }
        
        var largest:Int = 0
        var largestKey:Character?
        for (character, number) in counts {
            if number > largest {
                largest = number
                largestKey = character
            }
        }
        return largestKey
    }
}