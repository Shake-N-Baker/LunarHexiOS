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
        updateScreenOffset()
        updateSelectionCircle()
    }
    
    /**
     Handles updating the menu when a new touch occurs.
     */
    public func touchBegan() {
        model.menu.tapOffsetStart = model.menu.screenOffset
    }
    
    /**
     Handles updating the menu when a touch event changes position.
     */
    public func touchMoved() {
        model.menu.screenOffset = model.menu.tapOffsetStart + model.touch.downX - model.touch.x
        model.menu.screenOffset = min(max(model.menu.screenOffset, 0), model.menu.screenOffsetRightBound)
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
            calculateTapVelocity()
        }
    }
    
    /**
    Handles updating the screen offset of the menu.
    */
    private func updateScreenOffset() {
        if (!model.touch.tapping) {
            if (model.menu.tapVelocity != 0) {
                applyTapVelocity()
            } else {
                slideToNearestLevel()
            }
        }
    }
    
    /**
    Handles updating the selection circle of the menu.
    */
    private func updateSelectionCircle() {
        let viewingLevel: CGFloat = CGFloat(model.menu.screenOffset) / CGFloat(model.menu.levelSpacing)
        var differenceFromCenter: Int = model.menu.screenOffset % model.menu.levelSpacing
        if (differenceFromCenter > (model.menu.levelSpacing / 2)) {
            differenceFromCenter -= model.menu.levelSpacing
            differenceFromCenter *= -1
        }
        if (differenceFromCenter < model.menu.selectionCircleRadius && round(viewingLevel) != 0) {
            model.menu.selectionCircleTransparency = 1.0 - (CGFloat(differenceFromCenter) / CGFloat(model.menu.selectionCircleRadius))
            model.menu.selectionCircleScale = (CGFloat(model.menu.selectionCircleRadius) - CGFloat(differenceFromCenter)) / CGFloat(model.menu.selectionCircleRadius)
        } else {
            model.menu.selectionCircleTransparency = 0
            model.menu.selectionCircleScale = 0
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
        //  Check side levels if tapVelocity is 0, move level to center
        return false
    }
    
    /**
     Calculates the momentum from the latest touch event and adds or sets it to the tap velocity.
     */
    private func calculateTapVelocity() {
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
     Applies the velocity of recent touch events to continue sliding the menu after a touch ends.
     */
    private func applyTapVelocity() {
        model.menu.screenOffset += model.menu.tapVelocity
        if (model.menu.screenOffset < 0) {
            model.menu.screenOffset = 0
            model.menu.tapVelocity = 0
        } else if (model.menu.screenOffset > model.menu.screenOffsetRightBound) {
            model.menu.screenOffset = model.menu.screenOffsetRightBound
            model.menu.tapVelocity = 0
        }
        
        if (model.menu.tapVelocity > 0) {
            model.menu.tapVelocity -= model.menu.tapVelocityResistance
            model.menu.tapVelocity = max(model.menu.tapVelocity, 0)
        } else {
            model.menu.tapVelocity += model.menu.tapVelocityResistance
            model.menu.tapVelocity = min(model.menu.tapVelocity, 0)
        }
    }
    
    /**
     Slides the screen to center on the nearest level.
     */
    private func slideToNearestLevel() {
        if (model.menu.screenOffset % model.menu.levelSpacing != 0) {
            var distanceLeft: Int
            if (model.menu.screenOffset % model.menu.levelSpacing > (model.menu.levelSpacing / 2)) {
                distanceLeft = model.menu.levelSpacing - (model.menu.screenOffset % model.menu.levelSpacing)
                if (distanceLeft > model.menu.idleCenteringVelocity) {
                    model.menu.screenOffset += model.menu.idleCenteringVelocity
                } else {
                    model.menu.screenOffset += distanceLeft
                }
            } else {
                distanceLeft = model.menu.screenOffset % model.menu.levelSpacing
                if (distanceLeft > model.menu.idleCenteringVelocity) {
                    model.menu.screenOffset -= model.menu.idleCenteringVelocity
                } else {
                    model.menu.screenOffset -= distanceLeft
                }
            }
        }
    }
    
    /**
     Calculates and assigns the menu view positions based on the screen dimensions.
     */
    private func calculateMenuPositions() {
        model.menu.titleX = Int(CGFloat(model.screenWidth) * Constants.menuTitleXScreens)
        model.menu.titleY = Int(CGFloat(model.screenHeight) * Constants.menuTitleYScreens)
        model.menu.selectionCircleX = Int(CGFloat(model.screenWidth) * Constants.menuSelectionCircleXScreens)
        model.menu.selectionCircleY = Int(CGFloat(model.screenHeight) * Constants.menuSelectionCircleYScreens)
        model.menu.selectionCircleRadius = Int(Utils.distanceBetweenPoints(x1: 0, y1: 0, x2: Double(model.screenWidth), y2: Double(model.screenHeight)) / Constants.menuSelectionCircleRadiusDivisor)
        model.menu.idleCenteringVelocity = max(Int(CGFloat(model.screenWidth) * Constants.idleCenteringVelocityXScreens), 1)
        model.menu.maxTapVelocity = max(Int(CGFloat(model.screenWidth) * Constants.maxTapVelocityXScreens), 1)
        model.menu.tapVelocityResistance = max(Int(CGFloat(model.screenWidth) * Constants.tapVelocityResistanceXScreens), 1)
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
