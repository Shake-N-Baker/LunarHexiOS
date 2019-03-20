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
     The random level label.
     */
    var random: SKLabelNode!
    
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
        title.position = CGPoint(x: model.menu.titleX, y: model.menu.titleY)
        title.fontSize = 60
        title.text = "LUNAR HEX"
        title.fontColor = SKColor.white
        scene.addChild(title)
        random = SKLabelNode(fontNamed: "Lato-Regular")
        random.zPosition = 1
        random.position = CGPoint(x: model.menu.randomX, y: model.menu.randomY)
        random.fontSize = 30
        random.text = "RANDOM"
        random.fontColor = SKColor.white
        scene.addChild(random)
    }
    
    /**
     Handles updating the menu view for the current game tick.
     */
    public func update() {
        title.position = CGPoint(x: model.menu.titleX - model.menu.screenOffset, y: model.menu.titleY)
        random.position = CGPoint(x: model.menu.randomX - model.menu.screenOffset, y: model.menu.randomY)
    }
}
