//
//  GameScene.swift
//  LunarHex
//
//  Created by Ian Baker on 1/2/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 The Game Scene class handles display of the game.
 */
class GameScene: SKScene {
    
    /**
     The menu title label
     */
    var title: SKLabelNode!
    
    override func didMove(to view: SKView) {
        initialize()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    /**
     Initializes the view elements of the game scene.
    */
    private func initialize() {
        title = SKLabelNode(fontNamed: "Lato-Heavy")
        title.zPosition = 1
        title.position = CGPoint(x: (size.width * 0.5), y: (size.height * 0.85))
        title.fontSize = 60
        title.text = "LUNAR HEX"
        title.fontColor = SKColor.red
        self.addChild(title)
    }
}
