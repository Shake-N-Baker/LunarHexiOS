//
//  GameView.swift
//  LunarHex
//
//  Created by Ian Baker on 11/1/20.
//  Copyright © 2020 Ian Baker. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 The Game View class handles displaying the game.
 */
class GameView {

    /**
     Reference to the scene.
     */
    var scene: MainScene!

    /**
     Reference to the main model.
     */
    var model: MainModel!

    /**
     The container holding all elements of the game.
     */
    var container: SKShapeNode!

    /**
     The home button.
     */
    var homeButton: SKSpriteNode!

    /**
     The new board button.
     */
    var newBoardButton: SKSpriteNode!

    /**
     The new board settings button.
     */
    var settingsButton: SKSpriteNode!

    /**
     The retry button.
     */
    var retryButton: SKSpriteNode!

    /**
     The hint button.
     */
    var hintButton: SKSpriteNode!

    /**
     Initializes the game view.
     - Parameter mainScene: Reference to the main scene.
     - Parameter mainModel: Reference to the main model.
     */
    public init(_ mainScene: MainScene, _ mainModel: MainModel) {
        scene = mainScene
        model = mainModel
        container = SKShapeNode(circleOfRadius: 0)
        container.position = CGPoint(x: 0, y: 0)
        scene.addChild(container)
        initializeHomeButton()
        initializeNewBoardButton()
        initializeSettingsButton()
        initializeRetryButton()
        initializeHintButton()
    }

    /**
     Handles updating the game view for the current game tick.
     */
    public func update() {
        if model.viewingMenu {
            container.isHidden = true
        } else {
            container.isHidden = false
        }
    }

    /**
     Initializes the home button.
     */
    private func initializeHomeButton() {
        let renderer: UIGraphicsImageRenderer = UIGraphicsImageRenderer(
            size: CGSize(width: model.game.gameIconWidth + (model.drawPaddingX * 2),
                         height: model.game.gameIconHeight + (model.drawPaddingY * 2)))
        let image: UIImage = renderer.image { (context) in
            context.cgContext.setFillColor(SKColor.white.cgColor)

            let width: CGFloat = CGFloat(model.game.gameIconWidth)
            let height: CGFloat = CGFloat(model.game.gameIconHeight)

            context.cgContext.translateBy(x: CGFloat(model.drawPaddingX!), y: CGFloat(model.drawPaddingY!))

            context.cgContext.move(to: CGPoint(x: 0, y: 0.5 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.5 * width, y: 0))
            context.cgContext.addLine(to: CGPoint(x: 0.7 * width, y: 0.19 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.7 * width, y: 0))
            context.cgContext.addLine(to: CGPoint(x: 0.83 * width, y: 0))
            context.cgContext.addLine(to: CGPoint(x: 0.83 * width, y: 0.34 * height))
            context.cgContext.addLine(to: CGPoint(x: width, y: 0.5 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.94 * width, y: 0.58 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.5 * width, y: 0.13 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.06 * width, y: 0.58 * height))
            context.cgContext.addLine(to: CGPoint(x: 0, y: 0.5 * height))
            context.cgContext.move(to: CGPoint(x: 0.17 * width, y: 0.58 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.5 * width, y: 0.24 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.83 * width, y: 0.58 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.83 * width, y: height))
            context.cgContext.addLine(to: CGPoint(x: 0.6 * width, y: height))
            context.cgContext.addLine(to: CGPoint(x: 0.6 * width, y: 0.7 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.4 * width, y: 0.7 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.4 * width, y: height))
            context.cgContext.addLine(to: CGPoint(x: 0.17 * width, y: height))
            context.cgContext.addLine(to: CGPoint(x: 0.17 * width, y: 0.58 * height))

            context.cgContext.drawPath(using: CGPathDrawingMode.fill)
        }
        let texture: SKTexture = SKTexture(image: image)

        homeButton = SKSpriteNode(texture: texture)
        homeButton.position = CGPoint(x: model.game.homeX, y: model.game.homeY)
        homeButton.zPosition = 101
        container.addChild(homeButton)
    }

    /**
     Initializes the new board button.
     */
    private func initializeNewBoardButton() {
        let renderer: UIGraphicsImageRenderer = UIGraphicsImageRenderer(
            size: CGSize(width: model.game.gameIconWidth + (model.drawPaddingX * 2),
                         height: model.game.gameIconHeight + (model.drawPaddingY * 2)))
        let image: UIImage = renderer.image { (context) in
            context.cgContext.setFillColor(SKColor.white.cgColor)
            context.cgContext.setStrokeColor(SKColor.white.cgColor)
            context.cgContext.setLineWidth(1)
            context.cgContext.setLineCap(CGLineCap.round)

            let width: CGFloat = CGFloat(model.game.gameIconWidth)
            let height: CGFloat = CGFloat(model.game.gameIconHeight)

            context.cgContext.translateBy(x: CGFloat(model.drawPaddingX!), y: CGFloat(model.drawPaddingY!))

            for i in 0...2 {
                for j in 0...2 {
                    if i == 2 && j == 2 {
                        break
                    }

                    let left: CGFloat = 0.3 * CGFloat(i) * width
                    let top: CGFloat = 0.3 * CGFloat(j) * height
                    context.cgContext.addRect(CGRect(x: left, y: top, width: 0.2 * width, height: 0.2 * height))
                }
            }
            context.cgContext.addRect(CGRect(x: 0.58 * width, y: 0.68 * height, width: 0.28 * width,
                                             height: 0.08 * height))
            context.cgContext.addRect(CGRect(x: 0.68 * width, y: 0.58 * height, width: 0.08 * width,
                                             height: 0.28 * height))

            context.cgContext.drawPath(using: CGPathDrawingMode.fill)

            context.cgContext.addEllipse(in: CGRect(x: 0.48 * width, y: 0.48 * height, width: 0.48 * width,
                                                    height: 0.48 * height))

            context.cgContext.drawPath(using: CGPathDrawingMode.stroke)
        }
        let texture: SKTexture = SKTexture(image: image)

        newBoardButton = SKSpriteNode(texture: texture)
        newBoardButton.position = CGPoint(x: model.game.gameIconRightX, y: model.game.newBoardY)
        newBoardButton.zPosition = 101
        container.addChild(newBoardButton)
    }

    /**
     Initializes the new board settings button.
     */
    private func initializeSettingsButton() {
        let renderer: UIGraphicsImageRenderer = UIGraphicsImageRenderer(
            size: CGSize(width: model.game.gameIconWidth + (model.drawPaddingX * 2),
                         height: model.game.gameIconHeight + (model.drawPaddingY * 2)))
        let image: UIImage = renderer.image { (context) in
            context.cgContext.setFillColor(SKColor.white.cgColor)

            let width: CGFloat = CGFloat(model.game.gameIconWidth)
            let height: CGFloat = CGFloat(model.game.gameIconHeight)

            context.cgContext.translateBy(x: CGFloat(model.drawPaddingX!), y: CGFloat(model.drawPaddingY!))

            context.cgContext.move(to: CGPoint(x: 0.4 * width, y: 0.02 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.6 * width, y: 0.02 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.6 * width, y: 0.13 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.69 * width, y: 0.16 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.77 * width, y: 0.09 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.9 * width, y: 0.22 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.83 * width, y: 0.3 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.87 * width, y: 0.39 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.98 * width, y: 0.4 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.98 * width, y: 0.6 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.87 * width, y: 0.6 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.83 * width, y: 0.68 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.9 * width, y: 0.77 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.77 * width, y: 0.89 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.69 * width, y: 0.82 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.6 * width, y: 0.86 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.6 * width, y: 0.98 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.4 * width, y: 0.98 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.4 * width, y: 0.86 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.31 * width, y: 0.82 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.23 * width, y: 0.89 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.1 * width, y: 0.77 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.17 * width, y: 0.69 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.13 * width, y: 0.6 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.02 * width, y: 0.6 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.02 * width, y: 0.4 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.13 * width, y: 0.4 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.18 * width, y: 0.31 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.1 * width, y: 0.22 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.23 * width, y: 0.1 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.31 * width, y: 0.17 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.4 * width, y: 0.13 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.4 * width, y: 0.02 * height))
            context.cgContext.addEllipse(in: CGRect(x: 0.25 * width, y: 0.25 * height, width: 0.5 * width,
                                                    height: 0.5 * height))

            context.cgContext.drawPath(using: CGPathDrawingMode.eoFill)
        }
        let texture: SKTexture = SKTexture(image: image)

        settingsButton = SKSpriteNode(texture: texture)
        settingsButton.position = CGPoint(x: model.game.gameIconRightX, y: model.game.settingsY)
        settingsButton.zPosition = 101
        container.addChild(settingsButton)
    }

    /**
     Initializes the retry button.
     */
    private func initializeRetryButton() {
        let renderer: UIGraphicsImageRenderer = UIGraphicsImageRenderer(
            size: CGSize(width: model.game.gameIconWidth + (model.drawPaddingX * 2),
                         height: model.game.gameIconHeight + (model.drawPaddingY * 2)))
        let image: UIImage = renderer.image { (context) in
            context.cgContext.setFillColor(SKColor.white.cgColor)

            let width: CGFloat = CGFloat(model.game.gameIconWidth)
            let height: CGFloat = CGFloat(model.game.gameIconHeight)

            context.cgContext.translateBy(x: CGFloat(model.drawPaddingX!), y: CGFloat(model.drawPaddingY!))

            context.cgContext.move(to: CGPoint(x: 0.5 * width, y: 0))
            context.cgContext.addLine(to: CGPoint(x: 0.5 * width, y: 0.35 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.675 * width, y: 0.175 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.5 * width, y: 0))

            context.cgContext.drawPath(using: CGPathDrawingMode.fill)

            context.cgContext.addArc(center: CGPoint(x: 0.5 * width, y: 0.5 * height), radius: 0.4 * height,
                                     startAngle: 0, endAngle: CGFloat.pi, clockwise: false)
            context.cgContext.addArc(center: CGPoint(x: 0.5 * width, y: 0.5 * height), radius: 0.3 * height,
                                     startAngle: 0, endAngle: CGFloat.pi, clockwise: false)
            context.cgContext.drawPath(using: CGPathDrawingMode.eoFill)

            context.cgContext.addArc(center: CGPoint(x: 0.5 * width, y: 0.5 * height), radius: 0.4 * height,
                                     startAngle: 0.5 * CGFloat.pi, endAngle: 1.5 * CGFloat.pi, clockwise: false)
            context.cgContext.addArc(center: CGPoint(x: 0.5 * width, y: 0.5 * height), radius: 0.3 * height,
                                     startAngle: 0.5 * CGFloat.pi, endAngle: 1.5 * CGFloat.pi, clockwise: false)
            context.cgContext.drawPath(using: CGPathDrawingMode.eoFill)
        }
        let texture: SKTexture = SKTexture(image: image)

        retryButton = SKSpriteNode(texture: texture)
        retryButton.position = CGPoint(x: model.game.gameIconRightX, y: model.game.retryY)
        retryButton.zPosition = 101
        container.addChild(retryButton)
    }

    /**
     Initializes the hint button.
     */
    private func initializeHintButton() {
        let renderer: UIGraphicsImageRenderer = UIGraphicsImageRenderer(
            size: CGSize(width: model.game.gameIconWidth + (model.drawPaddingX * 2),
                         height: model.game.gameIconHeight + (model.drawPaddingY * 2)))
        let image: UIImage = renderer.image { (context) in
            context.cgContext.setFillColor(SKColor.white.cgColor)

            let width: CGFloat = CGFloat(model.game.gameIconWidth)
            let height: CGFloat = CGFloat(model.game.gameIconHeight)

            context.cgContext.translateBy(x: CGFloat(model.drawPaddingX!), y: CGFloat(model.drawPaddingY!))

            context.cgContext.addEllipse(in: CGRect(x: 0.17 * width, y: 0, width: 0.65 * width,
                                                    height: 0.65 * height))
            context.cgContext.addEllipse(in: CGRect(x: 0.23 * width, y: 0.05 * height, width: 0.54 * width,
                                                    height: 0.581 * height))
            context.cgContext.drawPath(using: CGPathDrawingMode.eoFill)

            context.cgContext.move(to: CGPoint(x: 0.265 * width, y: 0.54 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.34 * width, y: 0.66 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.39 * width, y: 0.66 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.31 * width, y: 0.54 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.265 * width, y: 0.54 * height))

            context.cgContext.move(to: CGPoint(x: 0.74 * width, y: 0.54 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.65 * width, y: 0.66 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.605 * width, y: 0.66 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.69 * width, y: 0.54 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.74 * width, y: 0.54 * height))

            context.cgContext.addRect(CGRect(x: 0.34 * width, y: 0.66 * height, width: 0.31 * width,
                                             height: 0.21 * height))
            context.cgContext.addRect(CGRect(x: 0.39 * width, y: 0.71 * height, width: 0.21 * width,
                                             height: 0.11 * height))
            context.cgContext.addRect(CGRect(x: 0.38 * width, y: 0.88 * height, width: 0.23 * width,
                                             height: 0.05 * height))
            context.cgContext.addRect(CGRect(x: 0.4 * width, y: 0.94 * height, width: 0.19 * width,
                                             height: 0.05 * height))

            context.cgContext.move(to: CGPoint(x: 0.48 * width, y: 0.66 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.53 * width, y: 0.66 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.53 * width, y: 0.52 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.48 * width, y: 0.49 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.57 * width, y: 0.46 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.57 * width, y: 0.43 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.46 * width, y: 0.34 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.44 * width, y: 0.37 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.52 * width, y: 0.43 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.4 * width, y: 0.45 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.4 * width, y: 0.5 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.48 * width, y: 0.54 * height))
            context.cgContext.addLine(to: CGPoint(x: 0.48 * width, y: 0.66 * height))
            context.cgContext.drawPath(using: CGPathDrawingMode.fill)
        }
        let texture: SKTexture = SKTexture(image: image)

        hintButton = SKSpriteNode(texture: texture)
        hintButton.position = CGPoint(x: model.game.gameIconRightX, y: model.game.hintY)
        hintButton.zPosition = 101
        container.addChild(hintButton)
    }
}
