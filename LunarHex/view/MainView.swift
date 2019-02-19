//
//  MainView.swift
//  LunarHex
//
//  Created by Ian Baker on 1/2/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 The Main View class handles displaying the game and distributing view work to sub views.
 */
class MainView {
    
    /**
     Reference to the scene.
     */
    var scene: MainScene!
    
    /**
     The menu title label.
     */
    var title: SKLabelNode!
    
    /**
     Initializes the view.
     - Parameter mainScene: Reference to the main scene.
     */
    public func initialize(_ mainScene: MainScene) {
        scene = mainScene
        title = SKLabelNode(fontNamed: "Lato-Heavy")
        title.zPosition = 1
        title.position = CGPoint(x: (scene.size.width * 0.5), y: (scene.size.height * 0.85))
        title.fontSize = 60
        title.text = "LUNAR HEX"
        title.fontColor = SKColor.white
        scene.addChild(title)
    }
}
