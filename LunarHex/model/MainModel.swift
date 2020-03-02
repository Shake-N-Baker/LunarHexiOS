//
//  MainModel.swift
//  LunarHex
//
//  Created by Ian Baker on 1/13/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import CoreGraphics

/**
 The Main Model class holds the state of the game between itself and sub models.
 */
class MainModel {

    /**
     Reference to the menu model.
     */
    var menu: MenuModel!

    /**
     Reference to the touch event model.
     */
    var touch: TouchModel!

    /**
     Reference to the board model.
     */
    var board: BoardModel!

    /**
     The screen width measured from the scene.
     */
    var screenWidth: Int!

    /**
     The screen height measured from the scene.
     */
    var screenHeight: Int!

    /**
     The padding to put around drawn textures so they don't clip at the edges.
     */
    var drawPaddingX: Int!

    /**
     The padding to put around drawn textures so they don't clip at the edges.
     */
    var drawPaddingY: Int!

    /**
     Whether the current view is of the menu, else viewing a level of the game.
     */
    var viewingMenu: Bool = true

    /**
     Initializes the main model.
     - Parameter mainScene: Reference to the main scene.
     */
    public init(_ mainScene: MainScene) {
        board = BoardModel()
        menu = MenuModel()
        touch = TouchModel()
        screenWidth = Int(mainScene.size.width)
        screenHeight = Int(mainScene.size.height)
    }
}
