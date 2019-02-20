//
//  MenuView.swift
//  LunarHex
//
//  Created by Ian Baker on 2/19/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 The Menu View class handles displaying the menu.
 */
class MenuView {
    
    /**
     Reference to the scene.
     */
    var scene: MainScene!
    
    /**
     Reference to the main model.
     */
    var model: MainModel!
    
    /**
     The menu title label.
     */
    var title: SKLabelNode!
    
    /**
     Initializes the menu view.
     - Parameter mainScene: Reference to the main scene.
     - Parameter mainModel: Reference to the main model.
     */
    public init(_ mainScene: MainScene, _ mainModel: MainModel) {
        scene = mainScene
        model = mainModel
        title = SKLabelNode(fontNamed: "Lato-Heavy")
        title.zPosition = 1
        title.position = CGPoint(x: (scene.size.width * 0.5), y: (scene.size.height * 0.85))
        title.fontSize = 60
        title.text = "LUNAR HEX"
        title.fontColor = SKColor.white
        scene.addChild(title)
    }
    
    /**
     Handles updating the menu view for the current game tick.
     */
    public func update() {
    }
}
