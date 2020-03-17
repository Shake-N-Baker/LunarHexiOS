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
     The total number of board pieces in play on the board.
     */
    var totalPieces: Int = 2

    /**
     The red board piece.
     */
    var red: BoardPiece = BoardPiece(colorIndex: PieceColor.red)

    /**
     The green board piece.
     */
    var green: BoardPiece = BoardPiece(colorIndex: PieceColor.green)

    /**
     The blue board piece.
     */
    var blue: BoardPiece = BoardPiece(colorIndex: PieceColor.blue)

    /**
     The yellow board piece.
     */
    var yellow: BoardPiece = BoardPiece(colorIndex: PieceColor.yellow)

    /**
     The orange board piece.
     */
    var orange: BoardPiece = BoardPiece(colorIndex: PieceColor.orange)

    /**
     The purple board piece.
     */
    var purple: BoardPiece = BoardPiece(colorIndex: PieceColor.purple)

    /**
     The pieces in order: red, green, blue, yellow, orange, purple.
     */
    var pieces: [BoardPiece]

    /**
     Initializes the board state model.
     */
    public init() {
        pieces = [red, green, blue, yellow, orange, purple]
    }
}
