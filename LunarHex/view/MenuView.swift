//
//  MenuView.swift
//  LunarHex
//
//  Created by Ian Baker on 2/19/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 The Menu View class handles displaying the menu.
 */
class MenuView {

    /**
     Reference to the scene.
     */
    var scene: MainScene!

    /**
     Reference to the main model.
     */
    var model: MainModel!

    /**
     The menu title label.
     */
    var title: SKLabelNode!

    /**
     The random level label.
     */
    var random: SKLabelNode!

    /**
     The array of level labels.
     */
    var levels: [SKLabelNode] = Array()

    /**
     The level selection circle.
     */
    var selectionCircle: SKShapeNode!

    /**
     The array of level labels.
     */
    var previewBoardCircles: [SKShapeNode] = Array()

    /**
     The hamburger menu icon.
     */
    var hamburgerMenu: SKSpriteNode!

    /**
     Initializes the menu view.
     - Parameter mainScene: Reference to the main scene.
     - Parameter mainModel: Reference to the main model.
     */
    public init(_ mainScene: MainScene, _ mainModel: MainModel) {
        scene = mainScene
        model = mainModel
        title = SKLabelNode(fontNamed: "Lato-Heavy")
        title.zPosition = 1
        title.position = CGPoint(x: model.menu.titleX, y: model.menu.titleY)
        title.fontSize = 60
        title.text = "LUNAR HEX"
        title.fontColor = SKColor.white
        scene.addChild(title)
        random = SKLabelNode(fontNamed: "Lato-Regular")
        random.zPosition = 1
        random.position = CGPoint(x: model.menu.randomX, y: model.menu.randomY)
        random.fontSize = 30
        random.text = "RANDOM"
        random.fontColor = SKColor.white
        scene.addChild(random)
        selectionCircle = SKShapeNode(circleOfRadius: CGFloat(model.menu.selectionCircleRadius))
        selectionCircle.zPosition = 1
        selectionCircle.position = CGPoint(x: model.menu.selectionCircleX, y: model.menu.selectionCircleY)
        selectionCircle.strokeColor = SKColor.white
        selectionCircle.glowWidth = 1.0
        selectionCircle.fillColor = SKColor.clear
        scene.addChild(selectionCircle)
        initializeLevelLabels()
        initializePreviewBoard()
        initializeHamburgerMenu()
    }

    /**
     Handles updating the menu view for the current game tick.
     */
    public func update() {
        title.position = CGPoint(x: model.menu.titleX - model.menu.screenOffset, y: model.menu.titleY)
        title.fontColor = SKColor.init(red: 1, green: 1, blue: 1, alpha: model.menu.titleTransparency)
        random.position = CGPoint(x: model.menu.randomX - model.menu.screenOffset, y: model.menu.randomY)
        random.fontColor = SKColor.init(red: 1, green: 1, blue: 1, alpha: model.menu.randomTransparency)
        for index in 1...Constants.levels {
            levels[index - 1].position = CGPoint(x: model.menu.levelX[index -
                1] - model.menu.screenOffset, y: model.menu.levelY[index - 1])
            levels[index - 1].fontColor = SKColor.init(red: 1, green: 1, blue:
                1, alpha: model.menu.levelTransparency[index - 1])
        }
        for index in 0...previewBoardCircles.count - 1 {
            previewBoardCircles[index].fillColor = model.menu.previewBoardColors[index]
        }
        selectionCircle.strokeColor = SKColor.init(red: 168/255, green:
            183/255, blue: 225/255, alpha:
            model.menu.selectionCircleTransparency)
        selectionCircle.setScale(model.menu.selectionCircleScale)
    }

    /**
     Initializes the level labels.
     */
    private func initializeLevelLabels() {
        for index in 1...Constants.levels {
            let level: SKLabelNode = SKLabelNode(fontNamed: "Lato-Regular")
            level.zPosition = 1
            level.position = CGPoint(x: model.menu.levelX[index - 1], y: model.menu.levelY[index - 1])
            level.fontSize = 30
            level.text = "\(index)"
            level.fontColor = SKColor.white
            scene.addChild(level)
            levels.append(level)
        }
    }

    /**
     Initializes the preview board.
     */
    private func initializePreviewBoard() {
        for column in 0...Constants.boardColumns - 1 {
            for row in 0...Constants.boardRows - 1 {
                if row == 5 {
                    if column != 1 && column != 3 {
                        // The final row only has 2 spaces instead of 5
                        continue
                    }
                }
                let previewCircle: SKShapeNode = SKShapeNode(circleOfRadius: 10)
                previewCircle.zPosition = 1
                let xPosition: Int = model.menu.previewBoardX + (column * model.menu.previewBoardSpacingX)
                let yPosition: Int
                if column % 2 == 0 {
                    yPosition = model.menu.previewBoardY - (row * model.menu.previewBoardSpacingY)
                } else {
                    yPosition = model.menu.previewBoardY - (row * model.menu.previewBoardSpacingY)
                        + Int(model.menu.previewBoardSpacingY / 2)
                }
                previewCircle.position = CGPoint(x: xPosition, y: yPosition)
                previewCircle.strokeColor = SKColor.clear
                previewCircle.glowWidth = 0
                previewCircle.fillColor = SKColor.red
                scene.addChild(previewCircle)
                previewBoardCircles.append(previewCircle)
            }
        }
    }

    /**
     Initializes the hamburger menu icon.
     */
    private func initializeHamburgerMenu() {
        let renderer: UIGraphicsImageRenderer = UIGraphicsImageRenderer(
            size: CGSize(width: model.menu.hamburgerWidth + (model.drawPaddingX * 2),
                         height: model.menu.hamburgerHeight + (model.drawPaddingY * 2)))
        let image: UIImage = renderer.image { (context) in
            context.cgContext.setStrokeColor(SKColor.white.cgColor)
            context.cgContext.setLineWidth(6)
            context.cgContext.setLineCap(CGLineCap.round)

            let left: Int = 0
            let right: Int = model.menu.hamburgerWidth
            let top: Int = 0
            let middle: Int = (model.menu.hamburgerHeight / 2)
            let bottom: Int = model.menu.hamburgerHeight

            context.cgContext.translateBy(x: CGFloat(model.drawPaddingX!), y: CGFloat(model.drawPaddingY!))

            context.cgContext.move(to: CGPoint(x: left, y: top))
            context.cgContext.addLine(to: CGPoint(x: right, y: top))
            context.cgContext.move(to: CGPoint(x: left, y: middle))
            context.cgContext.addLine(to: CGPoint(x: right, y: middle))
            context.cgContext.move(to: CGPoint(x: left, y: bottom))
            context.cgContext.addLine(to: CGPoint(x: right, y: bottom))

            context.cgContext.drawPath(using: CGPathDrawingMode.stroke)
        }
        let texture: SKTexture = SKTexture(image: image)

        hamburgerMenu = SKSpriteNode(texture: texture)
        hamburgerMenu.position = CGPoint(x: model.menu.hamburgerX, y: model.menu.hamburgerY)
        scene.addChild(hamburgerMenu)
    }
}
