//
//  BoardController.swift
//  LunarHex
//
//  Created by Ian Baker on 2/29/20.
//  Copyright © 2020 Ian Baker. All rights reserved.
//

import Foundation

/**
 The Board Controller class manages the list of playable boards.
 */
class BoardController {

    /**
     Reference to the main model.
     */
    var model: MainModel!

    /**
     Initializes the board controller.
     - Parameter mainModel: Reference to the main model.
     */
    public init(_ mainModel: MainModel) {
        model = mainModel
        setMainBoards()
    }

    /**
     Reads the main boards file and stores the values for later use.
     */
    private func setMainBoards() {
        if let filepath = Bundle.main.path(forResource: "MainBoards", ofType: "txt") {
            do {
                let content: String = try String(contentsOfFile: filepath)
                let lines: [Substring] = content.split { $0.isNewline }
                let boardString: String = String(lines.first!)
                let boards: [Substring] = boardString.split(separator: ",")
                for board in boards {
                    model.board.mainBoardsCompressed.append(String(board))
                }
            } catch {
                print("Main boards content could not be loaded!")
            }
        }
        for level in 0 ..< model.board.mainBoardsCompressed.count {
            model.board.mainBoards.append(getInitialBoardState(level: level))
        }
    }

    /**
     Returns the initial board state of the given level.
     - Parameter level: The desired level, 0 indexed, to retrieve initial board state.
     - Returns: The initial board state of the level.
     */
    private func getInitialBoardState(level: Int) -> BoardStateModel {
        let boardState: BoardStateModel = BoardStateModel()
        let boardString: String = model.board.mainBoardsCompressed[level]
        let solutionMovesString: String = boardString[0]
        let solutionMoves: Int = Int(solutionMovesString, radix: 36) ?? 0
        let piecePositionString: String = boardString[solutionMoves + 1 ..< boardString.count]

        // BoardState starts with 6 pieces, remove extra
        while boardState.pieces.count > piecePositionString.count {
            boardState.pieces.removeLast()
        }
        for index in 0 ..< boardState.pieces.count {
            let boardIndex: Int = Int(piecePositionString[index], radix: 36) ?? 0
            boardState.pieces[index].x = convertBoardIndexToX(boardIndex)
            boardState.pieces[index].y = convertBoardIndexToY(boardIndex)
        }
        return boardState
    }

    /**
     Converts the board index into the board x position.

     The following is a rough visual representation of the board indicies:
     ```
     00 01 02 03 04
     05 06 07 08 09
     10 11 12 13 14
     15 16 17 18 19
     20 21 22 23 24
     xx 25 xx 26 xx
     ```
     - Parameter index: The board index 0-26.
     - Returns: The board x coordinate of the given board index.
     */
    private func convertBoardIndexToX(_ index: Int) -> Int {
        switch index {
        case 25:
            return 1
        case 26:
            return 3
        default:
            return index % 5
        }
    }

    /**
     Converts the board index into the board y position.

     The following is a rough visual representation of the board indicies:
     ```
     00 01 02 03 04
     05 06 07 08 09
     10 11 12 13 14
     15 16 17 18 19
     20 21 22 23 24
     xx 25 xx 26 xx
     ```
     - Parameter index: The board index 0-26.
     - Returns: The board y coordinate of the given board index.
     */
    private func convertBoardIndexToY(_ index: Int) -> Int {
        switch index {
        case 25, 26:
            return 5
        default:
            return index / 5
        }
    }
}
