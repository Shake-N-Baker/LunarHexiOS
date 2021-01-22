//
//  GameModel.swift
//  LunarHex
//
//  Created by Ian Baker on 11/1/20.
//  Copyright © 2020 Ian Baker. All rights reserved.
//

import Foundation

/**
 The Game Model class holds the state of the game.
 */
class GameModel {

    /**
     The current level being played.
     */
    var currentLevel: Int!

    /**
     The width of the home, new board, settings, retry and hint game icons.
     */
    var gameIconWidth: Int!

    /**
     The height of the home, new board, settings, retry and hint game icons.
     */
    var gameIconHeight: Int!

    /**
     The right aligned game icons X coordinate.
     */
    var gameIconRightX: Int!

    /**
     The home icon position X coordinate.
     */
    var homeX: Int!

    /**
     The home icon position Y coordinate.
     */
    var homeY: Int!

    /**
     The new board icon position Y coordinate.
     */
    var newBoardY: Int!

    /**
     The settings icon position Y coordinate.
     */
    var settingsY: Int!

    /**
     The retry icon position Y coordinate.
     */
    var retryY: Int!

    /**
     The hint icon position Y coordinate.
     */
    var hintY: Int!

    /**
     Initializes the game model.
     */
    public init() {}
}
