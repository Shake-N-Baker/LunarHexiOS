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
     The title position X coordinate.
     */
    var titleX: Int!
    
    /**
     The title position Y coordinate.
     */
    var titleY: Int!
    
    /**
     Initializes the menu model.
     */
    public init() {
    }
}
