//
//  AnimationModel.swift
//  LunarHex
//
//  Created by Ian Baker on 10/25/20.
//  Copyright © 2020 Ian Baker. All rights reserved.
//

import Foundation

/**
 The type animation.
 */
enum AnimationType {
    case none, newCustomGame, startLevel, exitGame, transitionNextLevel
}

/**
 The Animation Model class holds the state of the current and or latest animation event.
 Such as transition animations from the game to the menu, and sliding piece animations.
 */
class AnimationModel {

    /**
     Whether the animation is currently fading the screen back in.
     */
    var fadingIn: Bool = false

    /**
     Whether the animation is currently fading the screen out.
     */
    var fadingOut: Bool = false

    /**
     The current animation frames left before the animation is finished.
     */
    var animationFramesLeft: Int = 0

    /**
     The current type of animation.
     */
    var animationType: AnimationType

    /**
     The selected level the animation is transitioning into.
     */
    var selectedLevel: Int = -2

    /**
     Initializes the animation model.
     */
    public init() {
        animationType = AnimationType.none
    }
}
