//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(myRobot: ComplexRobotObject) {
    
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)

        let myWallInfo = checkWalls(myRobot)
        
        let isThreeWayJunction = (myWallInfo.numberOfWalls == 1)
        
        let isTwoWayPath = (myWallInfo.numberOfWalls == 2)
        
        let isDeadEnd = (myWallInfo.numberOfWalls == 3)

        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        }
        
        if isThreeWayJunction && !robotIsBlocked {
            continueStraightOrRotate(myRobot)
        }
        
        if isTwoWayPath && !robotIsBlocked {
            myRobot.move()
        }
        
        if isTwoWayPath && robotIsBlocked {
            turnTowardClearPath(myRobot, wallInfo: myWallInfo)
        }
        
        if isDeadEnd {
            if !robotIsBlocked {
                myRobot.move()
            }
            else {
                myRobot.rotateRight()
            }
        }

    }
    
    func previousMoveIsFinished(robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
}