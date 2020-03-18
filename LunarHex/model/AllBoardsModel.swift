//
//  AllBoardsModel.swift
//  LunarHex
//
//  Created by Ian Baker on 3/1/20.
//  Copyright © 2020 Ian Baker. All rights reserved.
//

import Foundation

/**
 All Boards Model class holds the list of playable boards.
 */
class AllBoardsModel {

    /**
     The main list of boards used as levels where the first index represents the first level and
     second index represents the second level and so on.
     
     * Each board is stored in Base62 compressed string format, 0-9, a-z, A-Z.
     * The first character with value _m_ represents the number of optimal moves to
       solve the board.
     * All boards are optimally solvable in at least 20 moves.
     * The next _m_ characters represent a single move in an optimal solution for the
       board.
     * Each move is stored as a number where the first 6 values represent the red piece
       moving in one of the 6 possible directions, for instance 0 = red moves up.
     * The next 6 values represent the blue piece then the following pairs of 6 for green,
       yellow, orange and purple.
     * Finally the starting positions of each piece is represented by the final 2 to 6
       characters depending on how many pieces are in play for the given level.
     * The first character represents the red piece, followed by blue, green, yellow,
       orange and purple.
     * Each position is between 0 and 26 for each possible hexagon position of the board.
     
     As an example "__10h7__" is a board solvable in 1 move based on the first character.
     The single move "0" means red moves up. Red starts at board index 17 (h) and blue
     starts at board index 7.
     */
    var mainBoardsCompressed: [String] = Array()

    /**
     The main list of boards used as levels in their initial state.
     */
    var mainBoards: [BoardStateModel] = Array()

    /**
     Initializes the model holding all boards.
     */
    public init() {
    }
}
