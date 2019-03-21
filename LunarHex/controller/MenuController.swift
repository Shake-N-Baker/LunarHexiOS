//
//  MenuController.swift
//  LunarHex
//
//  Created by Ian Baker on 2/24/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import CoreGraphics

/**
 The Menu Controller class handles input and game logic for the menu.
 */
class MenuController {
    
    /**
     Reference to the main model.
     */
    var model: MainModel!
    
    /**
     Initializes the menu controller.
     - Parameter mainModel: Reference to the main model.
     */
    public init(_ mainModel: MainModel) {
        model = mainModel
        calculateMenuPositions()
    }
    
    /**
     Handles updating the menu for the current game tick.
     */
    public func update() {
        model.menu.screenOffset = model.menu.dragOffsetStart + model.touch.downX - model.touch.x
        if (model.menu.screenOffset < 0) {
            model.menu.screenOffset = 0
        } else if (model.menu.screenOffset > ((Constants.levels + 1) * model.menu.levelSpacing)) {
            model.menu.screenOffset = ((Constants.levels + 1) * model.menu.levelSpacing)
        }
    }
    
    /**
     Handles updating the menu when a new touch occurs.
     */
    public func touchBegan() {
        model.menu.dragOffsetStart = model.menu.screenOffset
    }
    
    /**
     Calculates and assigns the menu view positions based on the screen dimensions.
     */
    private func calculateMenuPositions() {
        model.menu.titleX = Int(CGFloat(model.screenWidth) * Constants.menutitleXScreens)
        model.menu.titleY = Int(CGFloat(model.screenHeight) * Constants.menutitleYScreens)
        model.menu.levelSpacing = Int(CGFloat(model.screenWidth) * Constants.levelSpacingXScreens)
        let levelTopLeftY: Int = Int(CGFloat(model.screenHeight) * Constants.levelsTopLeftYScreens)
        model.menu.randomX = model.menu.titleX + (model.menu.levelSpacing * (Constants.levels + 1))
        model.menu.randomY = levelTopLeftY
        for index in 1...Constants.levels {
            model.menu.levelX.append(model.menu.titleX + (model.menu.levelSpacing * index))
            model.menu.levelY.append(levelTopLeftY)
        }
    }
}
