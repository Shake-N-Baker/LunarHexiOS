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
    }
}
