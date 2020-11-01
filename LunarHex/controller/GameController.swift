//
//  GameController.swift
//  LunarHex
//
//  Created by Ian Baker on 11/1/20.
//  Copyright © 2020 Ian Baker. All rights reserved.
//

import Foundation

/**
 The Game Controller class handles input and game logic for the game.
 */
class GameController {

    /**
     Reference to the main model.
     */
    var model: MainModel!

    /**
     Initializes the game controller.
     - Parameter mainModel: Reference to the main model.
     */
    public init(_ mainModel: MainModel) {
        model = mainModel
    }

    /**
     Handles updating the game for the current game tick.
     */
    public func update() {
        // update code
    }

    /**
     Handles updating the game when a new touch occurs.
     */
    public func touchBegan() {
        // touch began code
    }

    /**
     Handles updating the game when a touch event changes position.
     */
    public func touchMoved() {
        // touch moved code
    }

    /**
     Handles updating the game when a touch ends.
     */
    public func touchEnded() {
        // touch ended code
    }
}
