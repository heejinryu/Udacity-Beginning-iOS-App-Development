//
//  CheckBadges.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func checkBadges(badges: [Badge], requestTypes: [UDRequestType]) -> Bool {
        var badgeRequestTypes = [UDRequestType]()
        for badge in badges {
            badgeRequestTypes.append(badge.requestType)
        }
        var unmatchedBadges:Int = 0
        for requestType in requestTypes {
            if !badgeRequestTypes.contains(requestType) {
                unmatchedBadges += 1
            }
        }
        if unmatchedBadges == 0 {
            return true
        } else {
            return false
        }
    }
}
