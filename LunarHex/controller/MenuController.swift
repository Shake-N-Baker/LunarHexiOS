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
        
    }
    
    /**
     Calculates and assigns the menu view positions based on the screen dimensions.
     */
    private func calculateMenuPositions() {
        model.menu.titleX = Int(CGFloat(model.screenWidth) * Constants.menutitleXScreens)
        model.menu.titleY = Int(CGFloat(model.screenHeight) * Constants.menutitleYScreens)
    }
}
