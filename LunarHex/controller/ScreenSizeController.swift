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
        setDrawPaddingValues()
        setScreenSizeMenuValues()
        setScreenSizeGameValues()
        setBackgroundValues()
    }

    /**
     Calculates and assigns the draw padding amounts based on the screen dimensions.
     */
    private func setDrawPaddingValues() {
        model.drawPaddingX = Int(CGFloat(model.screenWidth) * Constants.drawPaddingXScreens)
        model.drawPaddingY = Int(CGFloat(model.screenHeight) * Constants.drawPaddingYScreens)
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
        setMenuIconValues()
        setScreenSizeHamburgerMenuValues()
    }

    /**
     Assigns game values based on the screen dimensions.
     */
    private func setScreenSizeGameValues() {
        setGameIconValues()
    }

    /**
     Assigns hamburger menu values based on the screen dimensions.
     */
    private func setScreenSizeHamburgerMenuValues() {
        setHamburgerMenuLabelValues()
        setHamburgerMenuLinkValues()
        setHamburgerMenuVolumeSliderValues()
    }

    /**
     Assigns hamburger menu label values based on the screen dimensions.
     */
    private func setHamburgerMenuLabelValues() {
        let label = SKLabelNode(fontNamed: "Lato-Regular")
        label.fontSize = 15
        label.text = "FOLLOW ME ON TWITTER::"
        let labelHeight: CGFloat = (label.frame.size.height *
            Constants.hamburgerAfterCreditsSpacingMagnitude)
        model.menu.hamburgerMenu.audioX = Int(CGFloat(model.screenWidth) *
            Constants.hamburgerHeaderTextXScreens)
        model.menu.hamburgerMenu.audioY = Int(CGFloat(model.screenHeight) *
            Constants.hamburgerAudioYScreens)
        model.menu.hamburgerMenu.soundX = Int(CGFloat(model.screenWidth) *
            Constants.hamburgerTextXScreens)
        model.menu.hamburgerMenu.soundY = Int(CGFloat(model.screenHeight) *
            Constants.hamburgerSoundYScreens)
        model.menu.hamburgerMenu.musicX = Int(CGFloat(model.screenWidth) *
            Constants.hamburgerTextXScreens)
        model.menu.hamburgerMenu.musicY = Int(CGFloat(model.screenHeight) *
            Constants.hamburgerMusicYScreens)
        model.menu.hamburgerMenu.creditsX = Int(CGFloat(model.screenWidth) *
            Constants.hamburgerHeaderTextXScreens)
        model.menu.hamburgerMenu.creditsY = Int(CGFloat(model.screenHeight) *
            Constants.hamburgerCreditsYScreens)
        model.menu.hamburgerMenu.createdByX = Int(CGFloat(model.screenWidth) *
            Constants.hamburgerTextXScreens)
        model.menu.hamburgerMenu.createdByY = Int(CGFloat(model.screenHeight) *
            Constants.hamburgerCreditsYScreens - labelHeight)
        model.menu.hamburgerMenu.followMeX = Int(CGFloat(model.screenWidth) *
            Constants.hamburgerTextXScreens)
        model.menu.hamburgerMenu.followMeY = Int(CGFloat(model.screenHeight) *
            Constants.hamburgerCreditsYScreens - (labelHeight * 2))
        model.menu.hamburgerMenu.musicByX = Int(CGFloat(model.screenWidth) *
            Constants.hamburgerTextXScreens)
        model.menu.hamburgerMenu.musicByY = Int(CGFloat(model.screenHeight) *
            Constants.hamburgerCreditsYScreens - (labelHeight * 3))
        model.menu.hamburgerMenu.inspiredByX = Int(CGFloat(model.screenWidth) *
            Constants.hamburgerTextXScreens)
        model.menu.hamburgerMenu.inspiredByY = Int(CGFloat(model.screenHeight) *
            Constants.hamburgerCreditsYScreens - (labelHeight * 4))
    }

    /**
     Assigns hamburger menu link values based on the screen dimensions.
     */
    private func setHamburgerMenuLinkValues() {
        let label = SKLabelNode(fontNamed: "Lato-Regular")
        label.fontSize = 15
        label.text = "FOLLOW ME ON TWITTER::"
        let followMeWidth: CGFloat = label.frame.size.width
        let labelHeight: CGFloat = (label.frame.size.height *
            Constants.hamburgerAfterCreditsSpacingMagnitude)
        label.text = "MUSIC BY::"
        let musicByWidth: CGFloat = label.frame.size.width
        model.menu.hamburgerMenu.linkHeight = Int(labelHeight)
        label.text = "PRIVACY POLICY"
        model.menu.hamburgerMenu.privacyPolicyWidth = Int(label.frame.size.width)
        label.text = "@IANDEVSGAMES"
        model.menu.hamburgerMenu.twitterLinkWidth = Int(label.frame.size.width)
        label.text = "MILIEU"
        model.menu.hamburgerMenu.musicLinkWidth = Int(label.frame.size.width)
        label.text = "VIEW SOURCE CODE ON GITHUB"
        model.menu.hamburgerMenu.githubLinkWidth = Int(label.frame.size.width)
        model.menu.hamburgerMenu.privacyPolicyX = Int(CGFloat(model.screenWidth) *
            Constants.hamburgerHeaderTextXScreens)
        model.menu.hamburgerMenu.privacyPolicyY = Int(CGFloat(model.screenHeight) *
            Constants.hamburgerPrivacyPolicyYScreens)
        model.menu.hamburgerMenu.twitterLinkX = Int(CGFloat(model.screenWidth) *
            Constants.hamburgerTextXScreens + followMeWidth)
        model.menu.hamburgerMenu.twitterLinkY = Int(CGFloat(model.screenHeight) *
            Constants.hamburgerCreditsYScreens - (labelHeight * 2))
        model.menu.hamburgerMenu.musicLinkX = Int(CGFloat(model.screenWidth) *
            Constants.hamburgerTextXScreens + musicByWidth)
        model.menu.hamburgerMenu.musicLinkY = Int(CGFloat(model.screenHeight) *
            Constants.hamburgerCreditsYScreens - (labelHeight * 3))
        model.menu.hamburgerMenu.githubLinkX = Int(CGFloat(model.screenWidth) *
            Constants.hamburgerHeaderTextXScreens)
        model.menu.hamburgerMenu.githubLinkY = Int(CGFloat(model.screenHeight) *
            Constants.hamburgerGithubYScreens)
    }

    /**
     Assigns hamburger menu volume slider values based on the screen dimensions.
     */
    private func setHamburgerMenuVolumeSliderValues() {
        model.menu.hamburgerMenu.volumeSliderX = Int(CGFloat(model.screenWidth) *
            Constants.hamburgerVolumeSliderXScreens)
        model.menu.hamburgerMenu.volumeSliderWidth = Int(CGFloat(model.screenWidth) *
            Constants.hamburgerVolumeSliderWidthScreens)
        model.menu.hamburgerMenu.volumeSliderCircleRadius = model.menu.selectionCircleRadius /
            Constants.selectionCircleToVolumeSliderRatio
    }

    /**
     Calculates and assigns the background values based on the screen dimensions and menu values.
     */
    private func setBackgroundValues() {
        model.backgroundWidth = model.screenWidth +
            ((model.menu.levelSpacing * (Constants.levels + 1)) / Constants.backgroundOffsetDampeningMagnitude)
        model.backgroundX = model.backgroundWidth / 2
        model.backgroundY = model.screenHeight / 2
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
        model.menu.selectionCircleRadius = Int(Utils.distanceBetweenPoints(x1: 0, y1: 0,
            x2: Double(model.screenWidth) / Constants.menuSelectionCircleRadiusDivisor,
            y2: Double(model.screenHeight)) / Constants.menuSelectionCircleRadiusDivisor)
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
     Calculates and assigns the menu icons values based on the screen dimensions.
     */
    private func setMenuIconValues() {
        model.menu.hamburgerX = Int(CGFloat(model.screenWidth) * Constants.menuHamburgerXScreens) - model.drawPaddingX
        model.menu.hamburgerY = Int(CGFloat(model.screenHeight) * Constants.menuHamburgerYScreens) + model.drawPaddingY
        model.menu.hamburgerWidth = Int(CGFloat(model.screenWidth) * Constants.menuHamburgerWidthScreens)
        model.menu.hamburgerHeight = Int(CGFloat(model.screenHeight) * Constants.menuHamburgerHeightScreens)
        model.menu.starWidth = Int(CGFloat(model.screenWidth) * Constants.starWidthScreens)
        model.menu.starHeight = Int(CGFloat(model.screenHeight) * Constants.starHeightScreens)
    }

    /**
     Calculates and assigns the game icons values based on the screen dimensions.
     */
    private func setGameIconValues() {
        model.game.gameIconWidth = Int(CGFloat(model.screenWidth) * Constants.gameIconWidthScreens)
        model.game.gameIconHeight = Int(CGFloat(model.screenHeight) * Constants.gameIconHeightScreens)
        model.game.gameIconRightX = Int(CGFloat(model.screenWidth) * Constants.gameIconRightXScreens) -
            model.drawPaddingX
        model.game.homeX = Int(CGFloat(model.screenWidth) * Constants.gameHomeXScreens) - model.drawPaddingX
        model.game.homeY = Int(CGFloat(model.screenHeight) * Constants.gameHomeYScreens) + model.drawPaddingY
        model.game.newBoardY = Int(CGFloat(model.screenHeight) * Constants.gameIconRightFirstYScreens) +
            model.drawPaddingY
        model.game.settingsY = Int(CGFloat(model.screenHeight) * Constants.gameIconRightSecondYScreens) +
            model.drawPaddingY
        model.game.retryY = Int(CGFloat(model.screenHeight) * Constants.gameIconRightThirdYScreens) + model.drawPaddingY
        model.game.hintY = Int(CGFloat(model.screenHeight) * Constants.gameIconRightFourthYScreens) + model.drawPaddingY
    }
}
