//
//  HamburgerMenuController.swift
//  LunarHex
//
//  Created by Ian Baker on 9/16/20.
//  Copyright © 2020 Ian Baker. All rights reserved.
//

import CoreGraphics
import SpriteKit

/**
 The Hamburger Menu Controller class handles input and game logic for the hamburger menu.
 */
class HamburgerMenuController {

    /**
     Reference to the main model.
     */
    var model: MainModel!

    /**
     Initializes the hamburger menu controller.
     - Parameter mainModel: Reference to the main model.
     */
    public init(_ mainModel: MainModel) {
        model = mainModel
    }

    /**
     Checks the tap event on the hamburger menu to see if any buttons or other interactable objects were
     tapped and handles logic for if they were tapped.
     - Returns: Whether any buttons or other interactable objects were tapped.
     */
    public func handleHamburgerMenuTapEvent() -> Bool {
        if tappedHamburgerMenu() {
            model.menu.hamburgerMenuOpen = false
            return true
        }
        if tappedGithubLink() {
            if let url = URL(string: "https://github.com/Shake-N-Baker/LunarHexiOS") {
                UIApplication.shared.open(url)
            }
            return true
        }
        if tappedPrivacyPolicyLink() {
            if let url = URL(string: "https://ianscottbaker.com/privacy-lunar-hex") {
                UIApplication.shared.open(url)
            }
            return true
        }
        if tappedTwitterLink() {
            if let url = URL(string: "https://twitter.com/IanDevsGames") {
                UIApplication.shared.open(url)
            }
            return true
        }
        if tappedMusicLink() {
            if let url = URL(string: "https://milieumusic.bandcamp.com/track/soft-space") {
                UIApplication.shared.open(url)
            }
            return true
        }
        // Check sound control slider
        // Check music control slider
        return false
    }

    /**
     Checks whether a tap began and ended on the hamburger menu icon.
     - Returns: Whether the tap began and ended on the hamburger menu icon.
     */
    public func tappedHamburgerMenu() -> Bool {
        let x: Int = model.menu.hamburgerX - (model.menu.hamburgerWidth / 2) - model.drawPaddingX
        let y: Int = model.menu.hamburgerY - (model.menu.hamburgerHeight / 2) - model.drawPaddingY
        let width: Int = model.menu.hamburgerWidth + (model.drawPaddingX * 2)
        let height: Int = model.menu.hamburgerHeight + (model.drawPaddingY * 2)
        return tappedInSquare(x, y, width, height)
    }

    /**
     Checks whether a tap began and ended on the hamburger menu github link.
     - Returns: Whether the tap began and ended on the hamburger menu github link.
     */
    private func tappedGithubLink() -> Bool {
        let x: Int = model.menu.hamburgerMenu.githubLinkX
        let y: Int = model.menu.hamburgerMenu.githubLinkY
        let width: Int = model.menu.hamburgerMenu.githubLinkWidth
        let height: Int = model.menu.hamburgerMenu.linkHeight
        return tappedInSquare(x, y, width, height)
    }

    /**
     Checks whether a tap began and ended on the hamburger menu privacy policy link.
     - Returns: Whether the tap began and ended on the hamburger menu privacy policy link.
     */
    private func tappedPrivacyPolicyLink() -> Bool {
        let x: Int = model.menu.hamburgerMenu.privacyPolicyX
        let y: Int = model.menu.hamburgerMenu.privacyPolicyY
        let width: Int = model.menu.hamburgerMenu.privacyPolicyWidth
        let height: Int = model.menu.hamburgerMenu.linkHeight
        return tappedInSquare(x, y, width, height)
    }

    /**
     Checks whether a tap began and ended on the hamburger menu twitter link.
     - Returns: Whether the tap began and ended on the hamburger menu twitter link.
     */
    private func tappedTwitterLink() -> Bool {
        let x: Int = model.menu.hamburgerMenu.twitterLinkX
        let y: Int = model.menu.hamburgerMenu.twitterLinkY
        let width: Int = model.menu.hamburgerMenu.twitterLinkWidth
        let height: Int = model.menu.hamburgerMenu.linkHeight
        return tappedInSquare(x, y, width, height)
    }

    /**
     Checks whether a tap began and ended on the hamburger menu music link.
     - Returns: Whether the tap began and ended on the hamburger menu music link.
     */
    private func tappedMusicLink() -> Bool {
        let x: Int = model.menu.hamburgerMenu.musicLinkX
        let y: Int = model.menu.hamburgerMenu.musicLinkY
        let width: Int = model.menu.hamburgerMenu.musicLinkWidth
        let height: Int = model.menu.hamburgerMenu.linkHeight
        return tappedInSquare(x, y, width, height)
    }

    /**
     Checks whether a tap began and ended within a given square.
     - Parameter squareX: The X coordinate of the square.
     - Parameter squareY: The Y coordinate of the square.
     - Parameter squareWidth: The width of the square.
     - Parameter squareHeight: The height of the square.
     - Returns: Whether the tap began and ended within the square.
     */
    private func tappedInSquare(_ squareX: Int, _ squareY: Int, _ squareWidth: Int, _ squareHeight: Int) -> Bool {
        let startedInSquareX: Bool = squareX <= model.touch.downX && model.touch.downX <= squareX + squareWidth
        let startedInSquareY: Bool = squareY <= model.touch.downY && model.touch.downY <= squareY + squareHeight
        let endedInSquareX: Bool = squareX <= model.touch.x && model.touch.x <= squareX + squareWidth
        let endedInSquareY: Bool = squareY <= model.touch.y && model.touch.y <= squareY + squareHeight
        let startedInSquare: Bool = startedInSquareX && startedInSquareY
        let endedInSquare: Bool = endedInSquareX && endedInSquareY
        return startedInSquare && endedInSquare
    }
}
