//
//  TapController.swift
//  LunarHex
//
//  Created by Ian Baker on 9/22/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import CoreGraphics

/**
 The Tap Controller class handles input and game logic for managing tapping events and state.
 */
class TapController {
    
    /**
     Reference to the main model.
     */
    var model: MainModel!
    
    /**
     Initializes the tap controller.
     - Parameter mainModel: Reference to the main model.
     */
    public init(_ mainModel: MainModel) {
        model = mainModel
    }
    
    /**
     Handles updating the tap state for the current game tick.
     */
    public func update() {
        if (model.touch.tapping) {
            model.touch.tapPathX.removeLast()
            model.touch.tapPathX.insert(model.touch.x, at: 0)
            model.touch.tapDuration += 1
        }
    }
    
    /**
     Handles updating the tap state when a new touch occurs.
     */
    public func touchBegan() {
        model.touch.tapping = true
        model.touch.tapDuration = 0
        for index in 0...model.touch.tapPathX.count - 1 {
            model.touch.tapPathX[index] = model.touch.downX
        }
    }
    
    /**
     Handles updating the tap state when a touch ends.
     */
    public func touchEnded() {
        model.touch.tapping = false
    }
}
