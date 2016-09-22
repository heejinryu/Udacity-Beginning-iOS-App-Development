//
//  Protocols.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 10/26/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

protocol PenaltyCell {
    var location: GridLocation {get}
    var guaranteesHit: Bool {get}
    var penaltyText: String {get}
}
