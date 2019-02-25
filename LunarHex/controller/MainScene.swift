//
//  MainScene.swift
//  LunarHex
//
//  Created by Ian Baker on 2/17/19.
//  Copyright © 2019 Ian Baker. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 The Main Scene class acts as the main controller, handles updates from the scene and distributes them to sub controllers.
 */
class MainScene: SKScene {
    
    /**
     Game constants.
     */
    struct Constants {
        /**
         Length of time between in game ticks/frames/updates.
         */
        static let updateInterval: TimeInterval = 1/60
    }
    
    /**
     Reference to the main view handler.
     */
    var mainView: MainView!
    
    /**
     Reference to the main model.
     */
    var model: MainModel!
    
    /**
     The next time threshold for the game to update.
     */
    var nextUpdateTime: TimeInterval!
    
    /**
     Called immediately after a scene is presented by a view.
     - Parameter view: The view that is presenting the scene.
     */
    override func didMove(to view: SKView) {
        model = MainModel(self)
        mainView = MainView(self, model)
    }
    
    /**
     Performs any scene-specific updates that need to occur before scene actions are evaluated.
     - Parameter currentTime: The current system time.
     */
    override func update(_ currentTime: TimeInterval) {
        if nextUpdateTime == nil {
            nextUpdateTime = currentTime + Constants.updateInterval
        } else if currentTime >= nextUpdateTime {
            nextUpdateTime = currentTime + Constants.updateInterval
            mainView.update()
            model.menu.screenOffset += 1
        }
    }
}
