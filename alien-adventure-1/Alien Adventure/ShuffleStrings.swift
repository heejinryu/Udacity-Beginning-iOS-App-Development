//
//  ShuffleStrings.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func shuffleStrings(s1 s1: String, s2: String, shuffle: String) -> Bool {
        
        guard s1.characters.count + s2.characters.count + shuffle.characters.count != 0 else {
            return true
        }
        
        guard s1.characters.count + s2.characters.count == shuffle.characters.count else {
            return false
        }
        
        func charactersToArray(string: String) -> [Character] {
            
            var characterArray = [Character]()
            
            for i in 0..<string.characters.count {
                let character = string[string.startIndex.advancedBy(i)]
                characterArray.append(character)
            }
            return characterArray
        }
        
        func arrayOrderCheck(string: String) -> Int {
            
            var n = 0
            
            for i in 1..<string.characters.count {
                if shuffle.characters.indexOf(charactersToArray(string)[i-1]) < shuffle.characters.indexOf(charactersToArray(string)[i]) {
                    n += 0
                } else {
                    n += 1
                }
            }
            
            return n
        }
        
        
        
        if arrayOrderCheck(s1) + arrayOrderCheck(s2) == 0 {
            return true
        } else {
            return false
        }
    }
}
