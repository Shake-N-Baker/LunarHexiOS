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
     Initializes the main view.
     - Parameter mainScene: Reference to the main scene.
     - Parameter mainModel: Reference to the main model.
     */
    public init(_ mainScene: MainScene, _ mainModel: MainModel) {
        scene = mainScene
        model = mainModel
        menuView = MenuView(scene, model)
    }

    /**
     Handles updating the main view for the current game tick.
     */
    public func update() {
        menuView.update()
    }
}
