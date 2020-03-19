//
//  BoardStateModel.swift
//  LunarHex
//
//  Created by Ian Baker on 3/17/20.
//  Copyright © 2020 Ian Baker. All rights reserved.
//

import Foundation
import CoreGraphics

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
     The color name of the board piece.
     */
    var colorName: PieceColor

    /**
     The red color value of the board piece.
     */
    var red: CGFloat

    /**
     The green color value of the board piece.
     */
    var green: CGFloat

    /**
     The blue color value of the board piece.
     */
    var blue: CGFloat
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
        pieces = [BoardPiece(colorName: PieceColor.red, red: 170/255, green: 0, blue: 0),
                  BoardPiece(colorName: PieceColor.green, red: 0, green: 153/255, blue: 0),
                  BoardPiece(colorName: PieceColor.blue, red: 51/255, green: 51/255, blue: 153/255),
                  BoardPiece(colorName: PieceColor.yellow, red: 1, green: 1, blue: 0),
                  BoardPiece(colorName: PieceColor.orange, red: 221/255, green: 119/255, blue: 0),
                  BoardPiece(colorName: PieceColor.purple, red: 153/255, green: 0, blue: 170/255)]
    }
}
