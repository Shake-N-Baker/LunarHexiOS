//
//  MainModel.swift
//  LunarHex
//
//  Created by Ian Baker on 1/13/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import Foundation

/**
 The Main Model class holds the state of the game between itself and sub models.
 */
class MainModel {
    
    /**
     Reference to the menu model.
     */
    var menuModel: MenuModel!
    
    /**
     Whether the current view is of the menu, else viewing a level of the game.
     */
    var viewingMenu: Bool = true
    
    /**
     Initializes the main model.
     */
    public init() {
        menuModel = MenuModel()
    }
}
