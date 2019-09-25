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
     Reference to the main view handler.
     */
    var mainView: MainView!
    
    /**
     Reference to the main model.
     */
    var model: MainModel!
    
    /**
     Reference to the menu controller.
     */
    var menuController: MenuController!
    
    /**
     Reference to the tap event/state controller.
     */
    var tapController: TapController!
    
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
        menuController = MenuController(model)
        tapController = TapController(model)
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
            tapController.update()
            menuController.update()
            mainView.update()
        }
    }
    
    /**
     Tells this object that one or more new touches occurred in a view or window.
     - Parameter touches: A set of [UITouch](apple-reference-documentation://hsatbdjPCV) instances that represent the touches for the starting phase of the event, which is represented by event. For touches in a view, this set contains only one touch by default. To receive multiple touches, you must set the view's [isMultipleTouchEnabled](apple-reference-documentation://hsyDhIpFIc) property to true.
     - Parameter event: The event to which the touches belong.
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            model.touch.x = Int(touch.location(in: self).x)
            model.touch.downX = model.touch.x
            model.touch.y = Int(touch.location(in: self).y)
            model.touch.downY = model.touch.y
        }
        tapController.touchBegan()
        menuController.touchBegan()
    }
    
    /**
     Tells the responder when one or more touches associated with an event changed.
     - Parameter touches: A set of [UITouch](apple-reference-documentation://hsatbdjPCV) instances that represent the touches whose values changed. These touches all belong to the specified event. For touches in a view, this set contains only one touch by default. To receive multiple touches, you must set the view's [isMultipleTouchEnabled](apple-reference-documentation://hsyDhIpFIc) property to true.
     - Parameter event: The event to which the touches belong.
     */
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            model.touch.x = Int(touch.location(in: self).x)
            model.touch.y = Int(touch.location(in: self).y)
        }
        menuController.touchMoved()
    }
    
    /**
     Tells the responder when one or more fingers are raised from a view or window.
     - Parameter touches: A set of [UITouch](apple-reference-documentation://hsatbdjPCV) instances that represent the touches for the ending phase of the event represented by event. For touches in a view, this set contains only one touch by default. To receive multiple touches, you must set the view's [isMultipleTouchEnabled](apple-reference-documentation://hsyDhIpFIc) property to true.
     - Parameter event: The event to which the touches belong.
     */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            model.touch.x = Int(touch.location(in: self).x)
            model.touch.y = Int(touch.location(in: self).y)
        }
        tapController.touchEnded()
        menuController.touchEnded()
    }
}
