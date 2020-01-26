//
//  ScreenSizeController.swift
//  LunarHex
//
//  Created by Ian Baker on 1/25/20.
//  Copyright © 2020 Ian Baker. All rights reserved.
//

import SpriteKit

/**
 The Screen Size Controller class calculates the positions and dimensions of objects based on the screen dimensions.
 */
class ScreenSizeController {

    /**
     Reference to the main model.
     */
    var model: MainModel!

    /**
     Initializes the screen size controller.
     - Parameter mainModel: Reference to the main model.
     */
    public init(_ mainModel: MainModel) {
        model = mainModel
        setScreenSizeMenuValues()
    }

    /**
     Assigns menu values based on the screen dimensions.
     */
    private func setScreenSizeMenuValues() {
        setTitlePosition()
        setSelectionCircleValues()
        setVelocityValues()
        setPreviewBoardValues()
        setLevelLabelDimensions()
        setLevelJumpVelocities()
        setHamburgerIconValues()
    }

    /**
     Calculates and assigns the title position based on the screen dimensions.
     */
    private func setTitlePosition() {
        model.menu.titleX = Int(CGFloat(model.screenWidth) * Constants.menuTitleXScreens)
        model.menu.titleY = Int(CGFloat(model.screenHeight) * Constants.menuTitleYScreens)
    }

    /**
     Calculates and assigns the selection circle values based on the screen dimensions.
     */
    private func setSelectionCircleValues() {
        model.menu.selectionCircleX = Int(CGFloat(model.screenWidth) * Constants.menuSelectionCircleXScreens)
        model.menu.selectionCircleY = Int(CGFloat(model.screenHeight) * Constants.menuSelectionCircleYScreens)
        model.menu.selectionCircleRadius = Int(Utils.distanceBetweenPoints(x1: 0,
            y1: 0, x2: Double(model.screenWidth), y2: Double(model.screenHeight)) /
            Constants.menuSelectionCircleRadiusDivisor)
    }

    /**
     Calculates and assigns the velocity values based on the screen dimensions.
     */
    private func setVelocityValues() {
        model.menu.idleCenteringVelocity = max(Int(CGFloat(model.screenWidth) *
            Constants.idleCenteringVelocityXScreens), 1)
        model.menu.maxTapVelocity = max(Int(CGFloat(model.screenWidth) * Constants.maxTapVelocityXScreens), 1)
        model.menu.tapVelocityResistance = max(Int(CGFloat(model.screenWidth) *
            Constants.tapVelocityResistanceXScreens), 1)
    }

    /**
     Calculates and assigns the preview board values based on the screen dimensions.
     */
    private func setPreviewBoardValues() {
        model.menu.previewBoardX = Int(CGFloat(model.screenWidth) * Constants.previewBoardXScreens)
        model.menu.previewBoardY = Int(CGFloat(model.screenHeight) * Constants.previewBoardYScreens)
        model.menu.previewBoardSpacingX = Int(CGFloat(model.screenWidth) * Constants.previewBoardSpacingXScreens)
        model.menu.previewBoardSpacingY = Int(CGFloat(model.screenHeight) * Constants.previewBoardSpacingYScreens)
        for column in 0...Constants.boardColumns - 1 {
            for row in 0...Constants.boardRows - 1 {
                if row == 5 {
                    if column != 1 && column != 3 {
                        // The final row only has 2 spaces instead of 5
                        continue
                    }
                }
                model.menu.previewBoardColors.append(SKColor.clear)
            }
        }
    }

    /**
     Calculates and assigns the level label dimensions and values based on the screen dimensions.
     */
    private func setLevelLabelDimensions() {
        model.menu.levelSpacing = Int(CGFloat(model.screenWidth) * Constants.levelSpacingXScreens)
        model.menu.screenOffsetRightBound = ((Constants.levels + 1) * model.menu.levelSpacing)
        let levelTopLeftY: Int = Int(CGFloat(model.screenHeight) * Constants.levelsTopLeftYScreens)
        model.menu.randomX = model.menu.titleX + (model.menu.levelSpacing * (Constants.levels + 1))
        model.menu.randomY = levelTopLeftY
        for index in 1...Constants.levels {
            model.menu.levelX.append(model.menu.titleX + (model.menu.levelSpacing * index))
            model.menu.levelY.append(levelTopLeftY)
            model.menu.levelTransparency.append(0)
        }
    }

    /**
     Calculates and assigns the level selection jump velocities based on the screen dimensions.
     */
    private func setLevelJumpVelocities() {
        var sum: Int = 0
        var goal: Int = model.menu.levelSpacing
        var velocity: Int = 0
        while sum < goal {
            velocity += model.menu.tapVelocityResistance
            sum += velocity
        }
        velocity -= model.menu.tapVelocityResistance
        model.menu.jumpOneLevelVelocity = velocity

        goal *= 2
        while sum < goal {
            velocity += model.menu.tapVelocityResistance
            sum += velocity
        }
        velocity -= model.menu.tapVelocityResistance
        model.menu.jumpTwoLevelsVelocity = velocity
    }

    /**
     Calculates and assigns the hamburger icon values based on the screen dimensions.
     */
    private func setHamburgerIconValues() {
        model.menu.hamburgerX = Int(CGFloat(model.screenWidth) * Constants.menuHamburgerXScreens)
        model.menu.hamburgerY = Int(CGFloat(model.screenHeight) * Constants.menuHamburgerYScreens)
        model.menu.hamburgerWidth = Int(CGFloat(model.screenWidth) * Constants.menuHamburgerWidthScreens)
        model.menu.hamburgerHeight = Int(CGFloat(model.screenHeight) * Constants.menuHamburgerHeightScreens)
    }
}
