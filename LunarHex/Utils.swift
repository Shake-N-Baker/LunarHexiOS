//
//  Utils.swift
//  LunarHex
//
//  Created by Ian Baker on 9/25/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import Foundation
import CoreGraphics

/**
 The Utils class holds utility helper functions shared throughout the application.
 */
class Utils {
    /**
     Calculates the distance between two points.
     - Parameter x1: First point X coordinate.
     - Parameter y1: First point Y coordinate.
     - Parameter x2: Second point X coordinate.
     - Parameter y2: Second point Y coordinate.
     - Returns: The distance between two points.
     */
    static func distanceBetweenPoints(x1: Double, y1: Double, x2: Double, y2: Double) -> Double {
        return sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2))
    }
}
