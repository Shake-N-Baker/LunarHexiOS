//
//  MenuModel.swift
//  LunarHex
//
//  Created by Ian Baker on 2/19/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import Foundation
import CoreGraphics

/**
 The Menu Model class holds the state of the menu.
 */
class MenuModel {
    
    /**
     The translation magnitude between the left most point of the menu and the screen.
     */
    var screenOffset: Int = 0
    
    /**
     The maximum value the screen offset can reach.
     */
    var screenOffsetRightBound: Int!
    
    /**
     The initial value of the screen offset when the tap event began.
     */
    var tapOffsetStart: Int = 0
    
    /**
     The velocity of the menu sliding due to tap events.
     */
    var tapVelocity: Int = 0
    
    /**
     The maximum tap velocity.
     */
    var maxTapVelocity: Int!
    
    /**
     The tap velocity reduction per update.
     */
    var tapVelocityResistance: Int!
    
    /**
     The menu velocity per update to slide to a nearby level if not tapping or sliding already.
     */
    var idleCenteringVelocity: Int!
    
    /**
     The title position X coordinate.
     */
    var titleX: Int!
    
    /**
     The title position Y coordinate.
     */
    var titleY: Int!
    
    /**
     The level selection circle position X coordinate.
     */
    var selectionCircleX: Int!
    
    /**
    The level selection circle position Y coordinate.
     */
    var selectionCircleY: Int!
    
    /**
    The level selection circle radius.
     */
    var selectionCircleRadius: Int!
    
    /**
    The transparency 0.0 to 1.0 of the level selection circle.
     */
    var selectionCircleTransparency: CGFloat = 0
    
    /**
    The scale of the level selection circle.
     */
    var selectionCircleScale: CGFloat = 0
    
    /**
     The spacing between levels.
     */
    var levelSpacing: Int!
    
    /**
     The random level position X coordinate.
     */
    var randomX: Int!
    
    /**
     The random level position Y coordinate.
     */
    var randomY: Int!
    
    /**
     Array of level position X coordinates.
     */
    var levelX: Array<Int> = Array()
    
    /**
     Array of level position Y coordinates.
     */
    var levelY: Array<Int> = Array()
    
    /**
     Initializes the menu model.
     */
    public init() {
    }
}
