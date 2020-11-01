//
//  MainView.swift
//  LunarHex
//
//  Created by Ian Baker on 1/2/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 The Main View class handles displaying the game and distributing view work to sub views.
 */
class MainView {

    /**
     Reference to the scene.
     */
    var scene: MainScene!

    /**
     Reference to the main model.
     */
    var model: MainModel!

    /**
     Reference to the view in charge of displaying the menu.
     */
    var menuView: MenuView!

    /**
     Reference to the view in charge of displaying the game.
     */
    var gameView: GameView!

    /**
     The background image.
     */
    var background: SKSpriteNode!

    /**
     Initializes the main view.
     - Parameter mainScene: Reference to the main scene.
     - Parameter mainModel: Reference to the main model.
     */
    public init(_ mainScene: MainScene, _ mainModel: MainModel) {
        scene = mainScene
        model = mainModel
        menuView = MenuView(scene, model)
        gameView = GameView(scene, model)

        initializeBackground()
    }

    /**
     Handles updating the main view for the current game tick.
     */
    public func update() {
        background.position = CGPoint(
            x: model.backgroundX - (model.menu.screenOffset / Constants.backgroundOffsetDampeningMagnitude),
            y: model.backgroundY)
        menuView.update()
        gameView.update()
    }

    /**
     Initializes the background image.
     */
    private func initializeBackground() {
        let renderer: UIGraphicsImageRenderer = UIGraphicsImageRenderer(
            size: CGSize(width: model.backgroundWidth,
                         height: model.screenHeight))
        let image: UIImage = renderer.image { (context) in
            UIColor(red: 14/255, green: 21/255, blue: 42/255, alpha: 1).setFill()
            context.fill(CGRect(x: 0, y: 0, width: model.backgroundWidth, height: model.screenHeight))

            UIColor(red: 1, green: 1, blue: 1, alpha: 0.1).setFill()
            for _ in 0 ..< 200 {
                let size: Int = Int.random(in: 1 ... 5)
                UIBezierPath(ovalIn: CGRect.init(x: Int.random(in: 0 ..< model.backgroundWidth),
                                                 y: Int.random(in: 0 ..< model.screenHeight),
                                                 width: size, height: size)).fill()
            }
            for _ in 0 ..< 50 {
                let randomIndex: Int = Int.random(in: 0 ... 2)
                if randomIndex == 0 {
                    UIColor(red: 1, green: 1, blue: 1, alpha: 0.4).setFill()
                } else if randomIndex == 1 {
                    UIColor(red: 200/255, green: 200/255, blue: 247/255, alpha: 0.6).setFill()
                } else {
                    UIColor(red: 253/255, green: 200/255, blue: 222/255, alpha: 0.6).setFill()
                }
                let size: Int = Int.random(in: 1 ... 5)
                UIBezierPath(ovalIn: CGRect.init(x: Int.random(in: 0 ..< model.backgroundWidth),
                                                 y: Int.random(in: 0 ..< model.screenHeight),
                                                 width: size, height: size)).fill()
            }
        }
        let texture: SKTexture = SKTexture(image: image)

        background = SKSpriteNode(texture: texture)
        background.position = CGPoint(x: model.backgroundX, y: model.backgroundY)
        background.zPosition = -1
        scene.addChild(background)
    }
}
