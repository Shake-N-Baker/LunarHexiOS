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
     The array of level labels.
     */
    var levels: Array<SKLabelNode> = Array()
    
    /**
     The level selection circle.
     */
    var selectionCircle: SKShapeNode!
    
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
        for index in 1...Constants.levels {
            let level: SKLabelNode = SKLabelNode(fontNamed: "Lato-Regular")
            level.zPosition = 1
            level.position = CGPoint(x: model.menu.levelX[index - 1], y: model.menu.levelY[index - 1])
            level.fontSize = 30
            level.text = "\(index)"
            level.fontColor = SKColor.white
            scene.addChild(level)
            levels.append(level)
        }
        selectionCircle = SKShapeNode(circleOfRadius: CGFloat(model.menu.selectionCircleRadius))
        selectionCircle.zPosition = 1
        selectionCircle.position = CGPoint(x: model.menu.selectionCircleX, y: model.menu.selectionCircleY)
        selectionCircle.strokeColor = SKColor.white
        selectionCircle.glowWidth = 1.0
        selectionCircle.fillColor = SKColor.clear
        scene.addChild(selectionCircle)
    }
    
    /**
     Handles updating the menu view for the current game tick.
     */
    public func update() {
        title.position = CGPoint(x: model.menu.titleX - model.menu.screenOffset, y: model.menu.titleY)
        title.fontColor = SKColor.init(red: 1, green: 1, blue: 1, alpha: model.menu.titleTransparency)
        random.position = CGPoint(x: model.menu.randomX - model.menu.screenOffset, y: model.menu.randomY)
        random.fontColor = SKColor.init(red: 1, green: 1, blue: 1, alpha: model.menu.randomTransparency)
        for index in 1...Constants.levels {
            levels[index - 1].position = CGPoint(x: model.menu.levelX[index - 1] - model.menu.screenOffset, y: model.menu.levelY[index - 1])
            levels[index - 1].fontColor = SKColor.init(red: 1, green: 1, blue: 1, alpha: model.menu.levelTransparency[index - 1])
        }
        selectionCircle.strokeColor = SKColor.init(red: 168/255, green: 183/255, blue: 225/255, alpha: model.menu.selectionCircleTransparency)
        selectionCircle.setScale(model.menu.selectionCircleScale)
    }
}
