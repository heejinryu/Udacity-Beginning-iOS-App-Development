//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    init(length: Int, location: GridLocation, isVertical: Bool = false, isWooden: Bool = false) {
        self.length = length
        self.hitTracker = HitTracker()
        self.location = location
        self.isVertical = isVertical
        self.isWooden = isWooden
    }
    let length: Int
    let hitTracker: HitTracker
    let location: GridLocation
    let isVertical: Bool
    let isWooden: Bool
    var cells: [GridLocation] {
        get {
        let start = self.location
        let end: GridLocation = ShipEndLocation(self)
        var occupiedCells = [GridLocation]()
            if isVertical {
                for y in start.y...end.y {
                    occupiedCells.append(GridLocation(x: start.x, y: y))
                }
            } else {
                for x in start.x...end.x {
                    occupiedCells.append(GridLocation(x: x, y: start.y))
                }
            }
        return occupiedCells
        }
    }
}

struct Mine: PenaltyCell {
    let location: GridLocation
    let guaranteesHit: Bool
    let penaltyText: String
    
    init(location: GridLocation, penaltyText: String) {
        self.location = location
        self.guaranteesHit = false
        self.penaltyText = String()
    }
}

struct SeaMonster: PenaltyCell {
    let location: GridLocation
    let guaranteesHit: Bool
    let penaltyText: String
    
    init(location: GridLocation) {
        self.location = location
        self.guaranteesHit = true
        self.penaltyText = "Arghh You've hit a sea monster!!!"
    }
}


class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        let mediumShip1 = Ship(length: 3, location: GridLocation(x:0, y:0), isVertical: false, isWooden: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x:4, y:0), isVertical: false, isWooden: true)
        let smallShip = Ship(length: 2, location: GridLocation(x:0, y:2), isVertical: false, isWooden: false)
        let largeShip = Ship(length: 4, location: GridLocation(x:3, y:2), isVertical: false, isWooden: true)
        let extraLargeShip = Ship(length: 5, location: GridLocation(x:0, y:4), isVertical: false, isWooden: false)
        
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(smallShip)
        human.addShipToGrid(largeShip)
        human.addShipToGrid(extraLargeShip)
        
        let mine1 = Mine(location: GridLocation(x: 2, y: 3), penaltyText: "You hit a Mine!")
        let mine2 = Mine(location: GridLocation(x: 4, y: 5), penaltyText: "Boom! You hit a Mine!")
        
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        let finalScore: Int = ((5 - gameStats.enemyShipsRemaining) * gameStats.sinkBonus) + ((5 - gameStats.humanShipsSunk) * gameStats.shipBonus) - ((gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman) * gameStats.guessPenalty)

        print("the value of final score is \(finalScore)")
        
        return finalScore
    }
}
