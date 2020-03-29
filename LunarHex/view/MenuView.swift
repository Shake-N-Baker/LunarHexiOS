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
     The array of level stars.
     */
    var levelStars: [SKSpriteNode] = Array()

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
     The hamburger menu background.
     */
    var hamburgerMenuBackground: SKShapeNode!

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
        hamburgerMenuBackground = SKShapeNode(
            rect: CGRect(x: 0, y: 0, width: model.screenWidth, height: model.screenHeight))
        hamburgerMenuBackground.zPosition = 100
        hamburgerMenuBackground.strokeColor = SKColor.clear
        hamburgerMenuBackground.fillColor = SKColor.init(red: 0, green: 0, blue: 0, alpha: 192/255)
        scene.addChild(hamburgerMenuBackground)
        initializeLevelLabels()
        initializeLevelStars()
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
        for index in 0 ..< Constants.levels {
            levels[index].position = CGPoint(x: model.menu.levelX[index] - model.menu.screenOffset,
                y: model.menu.levelY[index])
            levels[index].fontColor = SKColor.init(red: 1, green: 1, blue: 1,
                alpha: model.menu.levelTransparency[index])
            levelStars[index].position = CGPoint(x: model.menu.levelX[index] - model.menu.screenOffset,
                y: model.menu.levelY[index] - model.menu.selectionCircleRadius)
            levelStars[index].alpha = model.menu.levelTransparency[index]
        }
        for index in 0...previewBoardCircles.count - 1 {
            previewBoardCircles[index].fillColor = model.menu.previewBoardColors[index]
            previewBoardCircles[index].run(SKAction.scale(to: model.menu.previewBoardCircleScale, duration: 0))
        }
        selectionCircle.strokeColor = SKColor.init(red: 168/255, green:
            183/255, blue: 225/255, alpha:
            model.menu.selectionCircleTransparency)
        selectionCircle.setScale(model.menu.selectionCircleScale)
        if model.menu.hamburgerMenuOpen {
            hamburgerMenuBackground.isHidden = false
        } else {
            hamburgerMenuBackground.isHidden = true
        }
    }

    /**
     Initializes the level labels.
     */
    private func initializeLevelLabels() {
        for index in 0 ..< Constants.levels {
            let level: SKLabelNode = SKLabelNode(fontNamed: "Lato-Regular")
            level.zPosition = 1
            level.position = CGPoint(x: model.menu.levelX[index], y: model.menu.levelY[index])
            level.fontSize = 30
            level.text = "\(index + 1)"
            level.fontColor = SKColor.white
            scene.addChild(level)
            levels.append(level)
        }
    }

    /**
     Initializes the level stars.
     */
    private func initializeLevelStars() {
        let unfinished: SKTexture = drawUnfinishedLevelStar()
        for index in 0 ..< Constants.levels {
            let star: SKSpriteNode = SKSpriteNode(texture: unfinished)
            star.position = CGPoint(x: model.menu.levelX[index] + (model.menu.starWidth / 2),
                                    y: model.menu.levelY[index] - model.menu.selectionCircleRadius)
            scene.addChild(star)
            levelStars.append(star)
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
        hamburgerMenu.zPosition = 101
        scene.addChild(hamburgerMenu)
    }

    /**
     Draws and returns a star for a level in an unfinished state in the form of a texture.
     - Returns: A star as a texture.
     */
    private func drawUnfinishedLevelStar() -> SKTexture {
        return drawStarTexture(
            strokeColor: SKColor.init(red: 89/255, green: 116/255, blue: 146/255, alpha: 1/2).cgColor,
            fillColor: SKColor.init(red: 46/255, green: 67/255, blue: 94/255, alpha: 1/2).cgColor)
    }

    /**
     Draws and returns a star for a level in a cleared but not perfect state in the form of a texture.
     - Returns: A star as a texture.
     */
    private func drawClearedLevelStar() -> SKTexture {
        return drawStarTexture(
            strokeColor: SKColor.init(red: 1, green: 1, blue: 1, alpha: 1).cgColor,
            fillColor: SKColor.init(red: 190/255, green: 200/255, blue: 200/255, alpha: 1).cgColor)
    }

    /**
     Draws and returns a star for a level in a perfect cleared state in the form of a texture.
     - Returns: A star as a texture.
     */
    private func drawPerfectLevelStar() -> SKTexture {
        return drawStarTexture(
            strokeColor: SKColor.init(red: 1, green: 1, blue: 1, alpha: 1).cgColor,
            fillColor: SKColor.init(red: 255/255, green: 215/255, blue: 45/255, alpha: 1).cgColor)
    }

    /**
     Draws and returns a star in the form of a texture.
     - Parameter strokeColor: The stroke color for the outside of the star.
     - Parameter fillColor: The fill color for the inside of the star.
     - Returns: A star as a texture.
     */
    private func drawStarTexture(strokeColor: CGColor, fillColor: CGColor) -> SKTexture {
        let renderer: UIGraphicsImageRenderer = UIGraphicsImageRenderer(
            size: CGSize(width: model.menu.starWidth + (model.drawPaddingX * 2),
                         height: model.menu.starHeight + (model.drawPaddingY * 2)))
        let image: UIImage = renderer.image { (context) in
            context.cgContext.setStrokeColor(strokeColor)
            context.cgContext.setFillColor(fillColor)
            context.cgContext.setLineWidth(1)
            context.cgContext.setLineCap(CGLineCap.round)

            let x1: Int = 0
            let x2: Int = Int(round(0.2 * Double(model.menu.starWidth)))
            let x3: Int = Int(round(0.3 * Double(model.menu.starWidth)))
            let x4: Int = Int(round(0.38 * Double(model.menu.starWidth)))
            let x5: Int = Int(round(0.5 * Double(model.menu.starWidth)))
            let x6: Int = Int(round(0.62 * Double(model.menu.starWidth)))
            let x7: Int = Int(round(0.7 * Double(model.menu.starWidth)))
            let x8: Int = Int(round(0.8 * Double(model.menu.starWidth)))
            let x9: Int = model.menu.starWidth
            let y1: Int = 0
            let y2: Int = Int(round(0.38 * Double(model.menu.starHeight)))
            let y3: Int = Int(round(0.62 * Double(model.menu.starHeight)))
            let y4: Int = Int(round(0.78 * Double(model.menu.starHeight)))
            let y5: Int = model.menu.starHeight

            context.cgContext.translateBy(x: CGFloat(model.drawPaddingX!), y: CGFloat(model.drawPaddingY!))

            context.cgContext.move(to: CGPoint(x: x5, y: y1))
            context.cgContext.addLine(to: CGPoint(x: x6, y: y2))
            context.cgContext.addLine(to: CGPoint(x: x9, y: y2))
            context.cgContext.addLine(to: CGPoint(x: x7, y: y3))
            context.cgContext.addLine(to: CGPoint(x: x8, y: y5))
            context.cgContext.addLine(to: CGPoint(x: x5, y: y4))
            context.cgContext.addLine(to: CGPoint(x: x2, y: y5))
            context.cgContext.addLine(to: CGPoint(x: x3, y: y3))
            context.cgContext.addLine(to: CGPoint(x: x1, y: y2))
            context.cgContext.addLine(to: CGPoint(x: x4, y: y2))
            context.cgContext.closePath()

            context.cgContext.drawPath(using: CGPathDrawingMode.fillStroke)
        }
        return SKTexture(image: image)
    }
}
