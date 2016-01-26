//
//  RobotTurningInstructions.swift
//  Maze
//
//  Created by Gabrielle Miller-Messner on 11/5/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import Foundation

extension ControlCenter {
    
    func randomlyRotateRightOrLeft(robot: ComplexRobotObject) {
        let randomNumber = arc4random() % 2
        
        if randomNumber == 0 {
            robot.rotateLeft()
        } else {
            robot.rotateRight()
        }
    }
    
    func continueStraightOrRotate(robot: ComplexRobotObject) {
        let randomNumber = arc4random() % 2
        
        let myWallInfo = checkWalls(robot)
        
        if randomNumber == 0 {
            turnTowardClearPath(robot, wallInfo: myWallInfo)
        } else {
            robot.move()
        }
    }


    func turnTowardClearPath(robot: ComplexRobotObject, wallInfo: (up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int)) {
    
            if robot.direction == .Left && wallInfo.down {
                robot.rotateRight()
            } else if robot.direction == .Up && wallInfo.left {
                robot.rotateRight()
            } else if robot.direction == .Right && wallInfo.up {
                robot.rotateRight()
            } else if robot.direction == .Down && wallInfo.right {
                robot.rotateRight()
            } else {
                robot.rotateLeft()
            }
    }

}