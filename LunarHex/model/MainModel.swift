//
//  MainModel.swift
//  LunarHex
//
//  Created by Ian Baker on 1/13/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 The Main Model class holds the state of the game between itself and sub models.
 */
class MainModel {
    
    /**
     Reference to the menu model.
     */
    var menu: MenuModel!
    
    /**
     The screen width measured from the scene.
     */
    var screenWidth: Int!
    
    /**
     The screen height measured from the scene.
     */
    var screenHeight: Int!
    
    /**
     Whether the current view is of the menu, else viewing a level of the game.
     */
    var viewingMenu: Bool = true
    
    /**
     Initializes the main model.
     - Parameter mainScene: Reference to the main scene.
     */
    public init(_ mainScene: MainScene) {
        menu = MenuModel()
        screenWidth = Int(mainScene.size.width)
        screenHeight = Int(mainScene.size.height)
    }
}
