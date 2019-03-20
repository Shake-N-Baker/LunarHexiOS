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
     The initial value of the screen offset when drag touch event began.
     */
    var dragOffsetStart: Int = 0
    
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
     Initializes the menu model.
     */
    public init() {
    }
}
