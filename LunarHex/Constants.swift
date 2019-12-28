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
     The position of the menu title in screen widths.
     */
    static let menuTitleXScreens: CGFloat = 0.5

    /**
     The position of the menu title in screen heights.
     */
    static let menuTitleYScreens: CGFloat = 0.85

    /**
     The position of the menu level selection circle in screen widths.
     */
    static let menuSelectionCircleXScreens: CGFloat = 0.5

    /**
     The position of the menu level selection circle in screen heights.
     */
    static let menuSelectionCircleYScreens: CGFloat = 0.27

    /**
     The display size divisor for calculating the menu level selection circle radius.
     */
    static let menuSelectionCircleRadiusDivisor: Double = 13

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
     Dampening magnitude to divide the tap velocity momentum by when a touch ends on the menu.
     */
    static let tapVelocityDampeningMagnitude: Int = 10

    /**
     The menu tap velocity reduction per update in screen widths.
     */
    static let tapVelocityResistanceXScreens: CGFloat = 0.001
}
