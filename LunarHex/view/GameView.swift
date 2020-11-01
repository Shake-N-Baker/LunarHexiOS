//
//  GameView.swift
//  LunarHex
//
//  Created by Ian Baker on 11/1/20.
//  Copyright © 2020 Ian Baker. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 The Game View class handles displaying the game.
 */
class GameView {

    /**
     Reference to the scene.
     */
    var scene: MainScene!

    /**
     Reference to the main model.
     */
    var model: MainModel!

    /**
     Initializes the game view.
     - Parameter mainScene: Reference to the main scene.
     - Parameter mainModel: Reference to the main model.
     */
    public init(_ mainScene: MainScene, _ mainModel: MainModel) {
        scene = mainScene
        model = mainModel
    }

    /**
     Handles updating the game view for the current game tick.
     */
    public func update() {
        // update code
    }
}
