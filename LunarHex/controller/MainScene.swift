//
//  MainScene.swift
//  LunarHex
//
//  Created by Ian Baker on 2/17/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 The Main Scene class receives and handles updates from the scene.
 */
class MainScene: SKScene {
    
    /**
     The game view handler.
     */
    var gameView: View!
    
    /**
     Called immediately after a scene is presented by a view.
     - Parameter view: The view that is presenting the scene.
     */
    override func didMove(to view: SKView) {
        gameView = View()
        gameView!.initialize(self)
    }
    
    /**
     Performs any scene-specific updates that need to occur before scene actions are evaluated.
     - Parameter currentTime: The current system time.
     */
    override func update(_ currentTime: TimeInterval) {
    }
}
