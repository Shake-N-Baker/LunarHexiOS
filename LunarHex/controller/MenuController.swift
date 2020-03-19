//
//  MenuController.swift
//  LunarHex
//
//  Created by Ian Baker on 2/24/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import CoreGraphics
import SpriteKit

/**
 The Menu Controller class handles input and game logic for the menu.
 */
class MenuController {

    /**
     Reference to the main model.
     */
    var model: MainModel!

    /**
     Initializes the menu controller.
     - Parameter mainModel: Reference to the main model.
     */
    public init(_ mainModel: MainModel) {
        model = mainModel
    }

    /**
     Handles updating the menu for the current game tick.
     */
    public func update() {
        updateScreenOffset()
        updateSelectionCircle()
        updateTextTransparency()
        updatePreviewBoard()
    }

    /**
     Handles updating the menu when a new touch occurs.
     */
    public func touchBegan() {
        model.menu.tapOffsetStart = model.menu.screenOffset
    }

    /**
     Handles updating the menu when a touch event changes position.
     */
    public func touchMoved() {
        model.menu.screenOffset = model.menu.tapOffsetStart + model.touch.downX - model.touch.x
        model.menu.screenOffset = min(max(model.menu.screenOffset, 0), model.menu.screenOffsetRightBound)
        model.menu.viewingLevel = CGFloat(model.menu.screenOffset) / CGFloat(model.menu.levelSpacing)
    }

    /**
     Handles updating the menu when a touch ends.
     */
    public func touchEnded() {
        let somethingTapped: Bool = handleTapEvent()
        if !somethingTapped {
            calculateTapVelocity()
        }
    }

    /**
     Handles updating the screen offset of the menu.
     */
    private func updateScreenOffset() {
        if !model.touch.tapping {
            if model.menu.tapVelocity != 0 {
                applyTapVelocity()
            } else {
                slideToNearestLevel()
            }
            model.menu.viewingLevel = CGFloat(model.menu.screenOffset) / CGFloat(model.menu.levelSpacing)
        }
    }

    /**
     Handles updating the selection circle of the menu.
     */
    private func updateSelectionCircle() {
        var differenceFromCenter: Int = model.menu.screenOffset % model.menu.levelSpacing
        if differenceFromCenter > (model.menu.levelSpacing / 2) {
            differenceFromCenter -= model.menu.levelSpacing
            differenceFromCenter *= -1
        }
        if differenceFromCenter < model.menu.selectionCircleRadius && round(model.menu.viewingLevel) != 0 {
            model.menu.selectionCircleTransparency = 1.0 -
                (CGFloat(differenceFromCenter) /
                CGFloat(model.menu.selectionCircleRadius))
            model.menu.selectionCircleScale =
                (CGFloat(model.menu.selectionCircleRadius) -
                CGFloat(differenceFromCenter)) /
                CGFloat(model.menu.selectionCircleRadius)
        } else {
            model.menu.selectionCircleTransparency = 0
            model.menu.selectionCircleScale = 0
        }
    }

    /**
     Handles updating the title, levels and random text transparency.
     */
    private func updateTextTransparency() {
        model.menu.titleTransparency = 1 - model.menu.viewingLevel
        var levelsFromText: CGFloat
        for index in 1...Constants.levels {
            levelsFromText = abs(model.menu.viewingLevel - CGFloat(index))
            model.menu.levelTransparency[index - 1] = 1 - (levelsFromText / 2.5)
        }
        levelsFromText = CGFloat(Constants.levels + 1) - model.menu.viewingLevel
        model.menu.randomTransparency = 1 - (levelsFromText / 2.5)
    }

    /**
     Handles updating the preview board circles.
     */
    private func updatePreviewBoard() {
        let level: Int = Int(round(model.menu.viewingLevel))
        let transparency: CGFloat
        if 1 <= level && level <= Constants.levels {
            transparency = model.menu.selectionCircleTransparency
        } else {
            transparency = 0
        }

        var index: Int = 0
        for column in 0...Constants.boardColumns - 1 {
            for row in 0...Constants.boardRows - 1 {
                if row == 5 {
                    if column != 1 && column != 3 {
                        // The final row only has 2 spaces instead of 5
                        continue
                    }
                }

                var noColorFound: Bool = true
                if 1 <= level && level <= Constants.levels {
                    for piece in model.board.mainBoards[level - 1].pieces {
                        if piece.x == column && piece.y == row {
                            noColorFound = false
                            model.menu.previewBoardColors[index] =
                                SKColor.init(red: piece.red, green: piece.green, blue: piece.blue, alpha: transparency)
                            break
                        }
                    }
                }

                if noColorFound {
                    // Tint the center red and color the rest of the spaces white
                    if column == 2 && row == 2 {
                        model.menu.previewBoardColors[index] = SKColor.init(red:
                            1, green: 146/255, blue: 146/255, alpha: transparency)
                    } else {
                        model.menu.previewBoardColors[index] =
                            SKColor.init(red: 1, green: 1, blue: 1, alpha: transparency)
                    }
                }
                index += 1
            }
        }
    }

    /**
     Checks the tap event to see if any buttons or other interactable objects were tapped and handles logic
     for if they were tapped.
     - Returns: Whether any buttons or other interactable objects were tapped.
     */
    private func handleTapEvent() -> Bool {
        var somethingTapped: Bool = false
        if model.menu.hamburgerMenuOpen {
            somethingTapped = handleHamburgerMenuTapEvent()
        } else {
            somethingTapped = handleMainMenuTapEvent()
        }
        return somethingTapped
    }

    /**
     Checks the tap event on the hamburger menu to see if any buttons or other interactable objects were
     tapped and handles logic for if they were tapped.
     - Returns: Whether any buttons or other interactable objects were tapped.
     */
    private func handleHamburgerMenuTapEvent() -> Bool {
        // Check close hamburger menu
        // Check github link
        // Check privacy policy link
        // Check twitter link
        // Check music link
        // Check sound control slider
        // Check music control slider
        return false
    }

    /**
     Checks the tap event on the main menu to see if any buttons or other interactable objects were tapped
     and handles logic for if they were tapped.
     - Returns: Whether any buttons or other interactable objects were tapped.
     */
    private func handleMainMenuTapEvent() -> Bool {
        // Check open hamburger menu
        if model.touch.tapDuration < 12 && model.menu.tapVelocity == 0 {
            if tappedInCircle(model.menu.selectionCircleX,
                model.menu.selectionCircleY, model.menu.selectionCircleRadius) {
                if Int(round(model.menu.viewingLevel)) == Constants.levels + 1 {
                    // Random level
                } else if Int(round(model.menu.viewingLevel)) != 0 {
                    // Play selected level
                }
                return true
            }
            // Check tapping side levels
            if tappedSideLevel(left: 2) {
                model.menu.tapVelocity = -model.menu.jumpTwoLevelsVelocity
                return true
            }
            if tappedSideLevel(left: 1) {
                model.menu.tapVelocity = -model.menu.jumpOneLevelVelocity
                return true
            }
            if tappedSideLevel(right: 1) {
                model.menu.tapVelocity = model.menu.jumpOneLevelVelocity
                return true
            }
            if tappedSideLevel(right: 2) {
                model.menu.tapVelocity = model.menu.jumpTwoLevelsVelocity
                return true
            }
        }
        return false
    }

    /**
     Checks whether a tap began and ended on one of the side levels.
     - Parameter left: Number of levels to the left of the current focused level
     - Parameter right: Number of levels to the right of the current focused level
     */
    private func tappedSideLevel(left: Int = 0, right: Int = 0) -> Bool {
        let sideLevel = Int(round(model.menu.viewingLevel)) + right - left
        if left != 0 {
            if tappedInCircle(model.menu.selectionCircleX - (model.menu.levelSpacing
                * left), model.menu.selectionCircleY, model.menu.selectionCircleRadius
                / 2) {
                return 1 <= sideLevel && sideLevel <= (Constants.levels + 1)
            }
        }
        if right != 0 {
            if tappedInCircle(model.menu.selectionCircleX + (model.menu.levelSpacing
                * right), model.menu.selectionCircleY, model.menu.selectionCircleRadius
                / 2) {
                return 1 <= sideLevel && sideLevel <= (Constants.levels + 1)
            }
        }
        return false
    }

    /**
     Checks whether a tap began and ended within a given circle.
     - Parameter circleX: The center of the circle X coordinate.
     - Parameter circleY: The center of the circle Y coordinate.
     - Parameter circleRadius: The circle radius.
     - Returns: Whether the tap began and ended within the circle.
     */
    private func tappedInCircle(_ circleX: Int, _ circleY: Int, _ circleRadius: Int) -> Bool {
        let startedInCircle: Bool = Utils.distanceBetweenPoints(x1: Double(circleX),
            y1: Double(circleY), x2: Double(model.touch.downX), y2:
            Double(model.touch.downY)) < Double(circleRadius)
        let endedInCircle: Bool = Utils.distanceBetweenPoints(x1: Double(circleX),
            y1: Double(circleY), x2: Double(model.touch.x), y2:
            Double(model.touch.y)) < Double(circleRadius)
        return startedInCircle && endedInCircle
    }

    /**
     Calculates the momentum from the latest touch event and adds or sets it to the tap velocity.
     */
    private func calculateTapVelocity() {
        if model.menu.tapVelocity * (model.touch.tapPathX.last! - model.touch.x) > 0 {
            // Dragging in the same direction, add onto the velocity
            model.menu.tapVelocity += (model.touch.tapPathX.last! - model.touch.x) /
                Constants.tapVelocityDampeningMagnitude
        } else {
            // Dragging in opposite direction, reset the velocity
            model.menu.tapVelocity = (model.touch.tapPathX.last! - model.touch.x) /
                Constants.tapVelocityDampeningMagnitude
        }
        model.menu.tapVelocity = min(max(model.menu.tapVelocity, -model.menu.maxTapVelocity), model.menu.maxTapVelocity)
    }

    /**
     Applies the velocity of recent touch events to continue sliding the menu after a touch ends.
     */
    private func applyTapVelocity() {
        model.menu.screenOffset += model.menu.tapVelocity
        if model.menu.screenOffset < 0 {
            model.menu.screenOffset = 0
            model.menu.tapVelocity = 0
        } else if model.menu.screenOffset > model.menu.screenOffsetRightBound {
            model.menu.screenOffset = model.menu.screenOffsetRightBound
            model.menu.tapVelocity = 0
        }

        if model.menu.tapVelocity > 0 {
            model.menu.tapVelocity -= model.menu.tapVelocityResistance
            model.menu.tapVelocity = max(model.menu.tapVelocity, 0)
        } else {
            model.menu.tapVelocity += model.menu.tapVelocityResistance
            model.menu.tapVelocity = min(model.menu.tapVelocity, 0)
        }
    }

    /**
     Slides the screen to center on the nearest level.
     */
    private func slideToNearestLevel() {
        if model.menu.screenOffset % model.menu.levelSpacing != 0 {
            var distanceLeft: Int
            if model.menu.screenOffset % model.menu.levelSpacing > (model.menu.levelSpacing / 2) {
                distanceLeft = model.menu.levelSpacing - (model.menu.screenOffset % model.menu.levelSpacing)
                if distanceLeft > model.menu.idleCenteringVelocity {
                    model.menu.screenOffset += model.menu.idleCenteringVelocity
                } else {
                    model.menu.screenOffset += distanceLeft
                }
            } else {
                distanceLeft = model.menu.screenOffset % model.menu.levelSpacing
                if distanceLeft > model.menu.idleCenteringVelocity {
                    model.menu.screenOffset -= model.menu.idleCenteringVelocity
                } else {
                    model.menu.screenOffset -= distanceLeft
                }
            }
        }
    }
}
