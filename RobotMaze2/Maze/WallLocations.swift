//
//  CollectingDataAboutWalls.swift
//  Maze
//
//  Created by Gabrielle Miller-Messner on 11/6/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import Foundation

extension ControlCenter {
    
    func isFacingWall(robot: ComplexRobotObject, direction: MazeDirection) -> Bool {
        
        let cell = mazeController.currentCell(robot)
        var isWall: Bool = false
        
        switch(direction) {
        case .Up:
            if cell.top {
                isWall = true
            }
        case .Right:
            if cell.right {
                isWall = true
            }
        case .Down:
            if cell.bottom {
                isWall = true
            }
        case .Left:
            if cell.left {
                isWall = true
            }
        }
        
        if isWall {
            return true
        } else {
            return false
        }
    }
    
    func checkWalls(robot:ComplexRobotObject) -> (up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int) {
        
        var numberOfWalls = 0
        let cell = mazeController.currentCell(robot)
        
        let isWallUp = cell.top
        if isWallUp {
            numberOfWalls++
        }
        
        let isWallRight = cell.right
        if isWallRight {
            numberOfWalls++
        }
        
        let isWallDown = cell.bottom
        if isWallDown {
            numberOfWalls++
        }
        
        let isWallLeft = cell.left
        if isWallLeft {
            numberOfWalls++
        }
        
        return (isWallUp, isWallRight, isWallDown, isWallLeft, numberOfWalls)
    }
}