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
     The position of the menu title in screen widths.
     */
    static let menutitleXScreens: CGFloat = 0.5
    
    /**
     The position of the menu title in screen heights.
     */
    static let menutitleYScreens: CGFloat = 0.85
    
    /**
     The top left position of the first level label in screen heights.
     */
    static let levelsTopLeftYScreens: CGFloat = 0.26
    
    /**
     The spacing between level labels in screen widths.
     */
    static let levelSpacingXScreens: CGFloat = 0.2
}
