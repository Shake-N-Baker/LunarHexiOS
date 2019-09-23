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
        model.menu.screenOffset = model.menu.tapOffsetStart + model.touch.downX - model.touch.x
        model.menu.screenOffset = min(max(model.menu.screenOffset, 0), model.menu.screenOffsetRightBound)
    }
    
    /**
     Handles updating the menu when a new touch occurs.
     */
    public func touchBegan() {
        model.menu.tapOffsetStart = model.menu.screenOffset
    }
    
    /**
     Handles updating the menu when a touch ends.
     */
    public func touchEnded() {
        var nothingTapped: Bool = true
        if (model.touch.tapDuration < 12) {
            nothingTapped = !handleTapEvent()
        }
        if (nothingTapped) {
            applyTapVelocity()
        }
    }
    
    /**
     Checks the tap event to see if any buttons or other interactable objects were tapped and handles logic for if they were tapped.
     - Returns: Whether any buttons or other interactable objects were tapped.
     */
    private func handleTapEvent() -> Bool {
        // If hamburger menu open
        //  Check close hamburger menu
        //  Check github link
        //  Check twitter link
        //  Check music link
        //  Check sound control slider
        //  Check music control slider
        // Else hamburger menu closed
        //  Check open hamburger menu
        //  Check current level/random selection circle
        //  Check side levels, move level to center
        return false
    }
    
    /**
     Applies the momentum from the latest touch event to the tap velocity.
     */
    private func applyTapVelocity() {
        if (model.menu.tapVelocity * (model.touch.tapPathX.last! - model.touch.x) > 0) {
            // Dragging in the same direction, add onto the velocity
            model.menu.tapVelocity += (model.touch.tapPathX.last! - model.touch.x) / Constants.tapVelocityDampeningMagnitude
        } else {
            // Dragging in opposite direction, reset the velocity
            model.menu.tapVelocity = (model.touch.tapPathX.last! - model.touch.x) / Constants.tapVelocityDampeningMagnitude
        }
        model.menu.tapVelocity = min(max(model.menu.tapVelocity, -model.menu.maxTapVelocity), model.menu.maxTapVelocity)
    }
    
    /**
     Calculates and assigns the menu view positions based on the screen dimensions.
     */
    private func calculateMenuPositions() {
        model.menu.titleX = Int(CGFloat(model.screenWidth) * Constants.menutitleXScreens)
        model.menu.titleY = Int(CGFloat(model.screenHeight) * Constants.menutitleYScreens)
        model.menu.maxTapVelocity = Int(CGFloat(model.screenWidth) * Constants.maxTapVelocityXScreens)
        model.menu.levelSpacing = Int(CGFloat(model.screenWidth) * Constants.levelSpacingXScreens)
        model.menu.screenOffsetRightBound = ((Constants.levels + 1) * model.menu.levelSpacing)
        let levelTopLeftY: Int = Int(CGFloat(model.screenHeight) * Constants.levelsTopLeftYScreens)
        model.menu.randomX = model.menu.titleX + (model.menu.levelSpacing * (Constants.levels + 1))
        model.menu.randomY = levelTopLeftY
        for index in 1...Constants.levels {
            model.menu.levelX.append(model.menu.titleX + (model.menu.levelSpacing * index))
            model.menu.levelY.append(levelTopLeftY)
        }
    }
}
