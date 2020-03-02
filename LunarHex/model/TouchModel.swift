//
//  TouchModel.swift
//  LunarHex
//
//  Created by Ian Baker on 3/17/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import Foundation

/**
 The Touch Model class holds the state of the current and or latest touch event.
 */
class TouchModel {

    /**
     The current x position of the touch event.
     */
    var x: Int = 0

    /**
     The current y position of the touch event.
     */
    var y: Int = 0

    /**
     The x position of the down touch event.
     */
    var downX: Int = 0

    /**
     The y position of the down touch event.
     */
    var downY: Int = 0

    /**
     Whether the user is currently tapping the screen.
     */
    var tapping: Bool = false

    /**
     Tracks how long the tap event has gone on.
     */
    var tapDuration: Int = 0

    /**
     Tracks the x position of the tap event over time.
     */
    var tapPathX: [Int] = Array(repeating: 0, count: 15)

    /**
     Initializes the touch model.
     */
    public init() {
    }
}
