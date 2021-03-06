//
//  Constants.swift
//  LunarHex
//
//  Created by Ian Baker on 2/24/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import Foundation
import CoreGraphics

/**
 The Constants class holds non-changing game values.
 */
class Constants {
    /**
     Length of time between in game ticks/frames/updates.
     */
    static let updateInterval: TimeInterval = 1/60

    /**
     The number of levels in the game.
     */
    static let levels: Int = 30

    /**
     The number of rows (and partial rows) in the game board.
     */
    static let boardRows: Int = 6

    /**
     The number of columns in the game board.
     */
    static let boardColumns: Int = 5

    /**
     The padding in screen widths to put around drawn textures so they don't clip at the edges.
     */
    static let drawPaddingXScreens: CGFloat = 0.01

    /**
     The padding in screen heights to put around drawn textures so they don't clip at the edges.
     */
    static let drawPaddingYScreens: CGFloat = 0.01

    /**
     The position of the menu title in screen widths.
     */
    static let menuTitleXScreens: CGFloat = 0.5

    /**
     The position of the menu title in screen heights.
     */
    static let menuTitleYScreens: CGFloat = 0.85

    /**
     The position of the menu hamburger icon in screen widths.
     */
    static let menuHamburgerXScreens: CGFloat = 0.9

    /**
     The position of the menu hamburger icon in screen heights.
     */
    static let menuHamburgerYScreens: CGFloat = 0.86

    /**
     The width of the menu hamburger icon in screen widths.
     */
    static let menuHamburgerWidthScreens: CGFloat = 0.06

    /**
     The height of the menu hamburger icon in screen heights.
     */
    static let menuHamburgerHeightScreens: CGFloat = 0.08

    /**
     The position of the hamburger menu header texts (audio, credits and the privacy policy and github links)
     in screen widths.
     */
    static let hamburgerHeaderTextXScreens: CGFloat = 0.08

    /**
     The position of the hamburger menu texts (sound, music, created by, follow me, music by, inspired by)
     in screen widths.
     */
    static let hamburgerTextXScreens: CGFloat = 0.12

    /**
     The position of the hamburger menu audio label in screen heights.
     */
    static let hamburgerAudioYScreens: CGFloat = 0.86

    /**
     The position of the hamburger menu sound label in screen heights.
     */
    static let hamburgerSoundYScreens: CGFloat = 0.79

    /**
     The position of the hamburger menu music label in screen heights.
     */
    static let hamburgerMusicYScreens: CGFloat = 0.68

    /**
     The position of the hamburger menu volume slider (sound / music) in screen widths.
     */
    static let hamburgerVolumeSliderXScreens: CGFloat = 0.32

    /**
     The width of the hamburger menu volume slider (sound / music) in screen widths.
     */
    static let hamburgerVolumeSliderWidthScreens: CGFloat = 0.47

    /**
     The position of the hamburger menu privacy policy link in screen heights.
     */
    static let hamburgerPrivacyPolicyYScreens: CGFloat = 0.56

    /**
     The position of the hamburger menu credits label in screen heights.
     */
    static let hamburgerCreditsYScreens: CGFloat = 0.43

    /**
     The magnitude of spacing for texts after the credits label in the hamburger menu.
     This number is multiplied against the text height to determine the spacing between texts.
     */
    static let hamburgerAfterCreditsSpacingMagnitude: CGFloat = 1.5

    /**
     The position of the hamburger menu github link in screen heights.
     */
    static let hamburgerGithubYScreens: CGFloat = 0.11

    /**
     The position of the menu level selection circle in screen widths.
     */
    static let menuSelectionCircleXScreens: CGFloat = 0.5

    /**
     The position of the menu level selection circle in screen heights.
     */
    static let menuSelectionCircleYScreens: CGFloat = 0.29

    /**
     The display size divisor for calculating the menu level selection circle radius.
     Calculated as distance between 0, 0 and screenWidth, screenHeight / this.
     */
    static let menuSelectionCircleRadiusDivisor: Double = 6

    /**
     The width of the star icon in screen widths.
     */
    static let starWidthScreens: CGFloat = 0.04

    /**
     The height of the star icon in screen heights.
     */
    static let starHeightScreens: CGFloat = 0.07

    /**
     The top left corner position of the menu preview board in screen widths.
     */
    static let previewBoardXScreens: CGFloat = 0.34

    /**
     The top left corner position of the menu preview board in screen heights.
     */
    static let previewBoardYScreens: CGFloat = 0.85

    /**
     The spacing between the menu preview board circles in screen widths.
     */
    static let previewBoardSpacingXScreens: CGFloat = 0.08

    /**
     The spacing between the menu preview board circles in screen heights.
     */
    static let previewBoardSpacingYScreens: CGFloat = 0.06

    /**
     The top left position of the first level label in screen heights.
     */
    static let levelsTopLeftYScreens: CGFloat = 0.26

    /**
     The spacing between level labels in screen widths.
     */
    static let levelSpacingXScreens: CGFloat = 0.2

    /**
     The menu velocity per update in screen widths to slide to a nearby level if not tapping or sliding already.
     */
    static let idleCenteringVelocityXScreens: CGFloat = 0.005

    /**
     The maximum tap velocity in screen widths.
     */
    static let maxTapVelocityXScreens: CGFloat = 0.08

    /**
     Dampening magnitude to divide the screen offset by when translating the background on the menu.
     */
    static let backgroundOffsetDampeningMagnitude: Int = 10

    /**
     Dampening magnitude to divide the tap velocity momentum by when a touch ends on the menu.
     */
    static let tapVelocityDampeningMagnitude: Int = 10

    /**
     The menu tap velocity reduction per update in screen widths.
     */
    static let tapVelocityResistanceXScreens: CGFloat = 0.001

    /**
     How many times bigger the selection circle radius is compared to the volume slider circle.
     Volume circle = selection circle radius / this number.
     */
    static let selectionCircleToVolumeSliderRatio: Int = 8

    /**
     The width of all game icons in screen widths.
     */
    static let gameIconWidthScreens: CGFloat = 0.06

    /**
     The height of all game icons in screen heights.
     */
    static let gameIconHeightScreens: CGFloat = 0.08

    /**
     The position of the game home icon in screen widths.
     */
    static let gameHomeXScreens: CGFloat = 0.07

    /**
     The position of the game home icon in screen heights.
     */
    static let gameHomeYScreens: CGFloat = 0.86

    /**
     The position of the right aligned game icons in screen widths.
     */
    static let gameIconRightXScreens: CGFloat = 0.92

    /**
     The position of the first right aligned game icon in screen heights.
     */
    static let gameIconRightFirstYScreens: CGFloat = 0.86

    /**
     The position of the second right aligned game icon in screen heights.
     */
    static let gameIconRightSecondYScreens: CGFloat = 0.61

    /**
     The position of the third right aligned game icon in screen heights.
     */
    static let gameIconRightThirdYScreens: CGFloat = 0.36

    /**
     The position of the fourth right aligned game icon in screen heights.
     */
    static let gameIconRightFourthYScreens: CGFloat = 0.11
}
