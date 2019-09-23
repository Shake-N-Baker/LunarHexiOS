//
//  MenuModel.swift
//  LunarHex
//
//  Created by Ian Baker on 2/19/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import Foundation

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
    var rightScreenOffsetBound: Int!
    
    /**
     The initial value of the screen offset when the tap event began.
     */
    var tapOffsetStart: Int = 0
    
    /**
     The velocity of the last tap event
     */
    var tapVelocity: Int = 0
    
    /**
     The title position X coordinate.
     */
    var titleX: Int!
    
    /**
     The title position Y coordinate.
     */
    var titleY: Int!
    
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
