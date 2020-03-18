//
//  BoardStateModel.swift
//  LunarHex
//
//  Created by Ian Baker on 3/17/20.
//  Copyright © 2020 Ian Baker. All rights reserved.
//

import Foundation

/**
 The color of a board piece.
 */
enum PieceColor {
    case red, green, blue, yellow, orange, purple
}

/**
 The position and color of a board piece.
 */
struct BoardPiece {

    /**
     The x coordinate of the piece on the board.
     */
    var x: Int = -1

    /**
     The y coordinate of the piece on the board.
     */
    var y: Int = -1

    /**
     The color of the board piece.
     */
    var colorIndex: PieceColor
}

/**
The Board State Model class holds the state of a board.
*/
class BoardStateModel {

    /**
     The pieces in order: red, green, blue, yellow, orange, purple.
     */
    var pieces: [BoardPiece]

    /**
     Initializes the board state model.
     */
    public init() {
        pieces = [BoardPiece(colorIndex: PieceColor.red),
                  BoardPiece(colorIndex: PieceColor.green),
                  BoardPiece(colorIndex: PieceColor.blue),
                  BoardPiece(colorIndex: PieceColor.yellow),
                  BoardPiece(colorIndex: PieceColor.orange),
                  BoardPiece(colorIndex: PieceColor.purple)]
    }
}
