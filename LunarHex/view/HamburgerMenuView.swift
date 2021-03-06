//
//  HamburgerMenuView.swift
//  LunarHex
//
//  Created by Ian Baker on 6/2/20.
//  Copyright © 2020 Ian Baker. All rights reserved.
//

import SpriteKit
import GameplayKit

/**
 The Hamburger Menu View class handles displaying the hamburger menu.
 */
class HamburgerMenuView {

    /**
     Reference to the scene.
     */
    var scene: MainScene!

    /**
     Reference to the main model.
     */
    var model: MainModel!

    /**
     The container holding all elements of the hamburger menu.
     */
    var container: SKShapeNode!

    /**
     The hamburger menu background.
     */
    var background: SKSpriteNode!

    /**
     The AUDIO label.
     */
    var audio: SKLabelNode!

    /**
     The SOUND: label.
     */
    var sound: SKLabelNode!

    /**
     The MUSIC: label.
     */
    var music: SKLabelNode!

    /**
     The PRIVACY POLICY link.
     */
    var privacyPolicy: SKLabelNode!

    /**
     The CREDITS label.
     */
    var credits: SKLabelNode!

    /**
     The CREATED BY: IAN BAKER label.
     */
    var createdBy: SKLabelNode!

    /**
     The FOLLOW ME ON TWITTER: label.
     */
    var followMe: SKLabelNode!

    /**
     The @IANDEVSGAMES twitter link.
     */
    var twitterLink: SKLabelNode!

    /**
     The MUSIC BY: label.
     */
    var musicBy: SKLabelNode!

    /**
     The link to the music author.
     */
    var musicLink: SKLabelNode!

    /**
     The INSPIRED BY: LUNAR LOCKOUT label.
     */
    var inspiredBy: SKLabelNode!

    /**
     The VIEW SOURCE CODE ON GITHUB link.
     */
    var githubLink: SKLabelNode!

    /**
     The sound volume control bar.
     */
    var soundBar: SKShapeNode!

    /**
     The sound volume control circle.
     */
    var soundCircle: SKShapeNode!

    /**
     The music volume control bar.
     */
    var musicBar: SKShapeNode!

    /**
     The music volume control circle.
     */
    var musicCircle: SKShapeNode!

    /**
     Initializes the hamburger menu view.
     - Parameter mainScene: Reference to the main scene.
     - Parameter mainModel: Reference to the main model.
     */
    public init(_ mainScene: MainScene, _ mainModel: MainModel) {
        scene = mainScene
        model = mainModel
        container = SKShapeNode(circleOfRadius: 0)
        container.position = CGPoint(x: 0, y: 0)
        scene.addChild(container)
        initializeBackground()
        initializeLabels()
        initializeLinks()
        initializeVolumeControls()
    }

    /**
     Handles updating the hamburger menu view for the current game tick.
     */
    public func update() {
        if model.menu.hamburgerMenuOpen {
            container.isHidden = false
            soundCircle.position = CGPoint(x: model.menu.hamburgerMenu.volumeSliderX +
                                            (model.menu.hamburgerMenu.volumeSliderWidth * model.menu.soundVolume) / 100,
                                           y: model.menu.hamburgerMenu.soundY)
            musicCircle.position = CGPoint(x: model.menu.hamburgerMenu.volumeSliderX +
                                            (model.menu.hamburgerMenu.volumeSliderWidth * model.menu.musicVolume) / 100,
                                           y: model.menu.hamburgerMenu.musicY)
        } else {
            container.isHidden = true
        }
    }

    /**
     Initializes the hamburger menu background.
     */
    private func initializeBackground() {
        let renderer: UIGraphicsImageRenderer = UIGraphicsImageRenderer(
            size: CGSize(width: model.screenWidth,
                         height: model.screenHeight))
        let image: UIImage = renderer.image { (context) in
            UIColor(red: 0, green: 0, blue: 0, alpha: 192/255).set()
            context.fill(CGRect(x: 0, y: 0, width: model.screenWidth, height: model.screenHeight))
        }
        let texture: SKTexture = SKTexture(image: image)

        background = SKSpriteNode(texture: texture)
        background.position = CGPoint(x: model.screenWidth / 2, y: model.screenHeight / 2)
        background.zPosition = 100
        container.addChild(background)
    }

    /**
     Initializes the hamburger menu labels.
     */
    private func initializeLabels() {
        audio = addLabel(
            position: CGPoint(x: model.menu.hamburgerMenu.audioX, y: model.menu.hamburgerMenu.audioY),
            size: 20,
            text: "AUDIO")
        sound = addLabel(
            position: CGPoint(x: model.menu.hamburgerMenu.soundX, y: model.menu.hamburgerMenu.soundY),
            size: 15,
            text: "SOUND:",
            verticalAlignment: SKLabelVerticalAlignmentMode.center)
        music = addLabel(
            position: CGPoint(x: model.menu.hamburgerMenu.musicX, y: model.menu.hamburgerMenu.musicY),
            size: 15,
            text: "MUSIC:",
            verticalAlignment: SKLabelVerticalAlignmentMode.center)
        credits = addLabel(
            position: CGPoint(x: model.menu.hamburgerMenu.creditsX, y: model.menu.hamburgerMenu.creditsY),
            size: 20,
            text: "CREDITS")
        createdBy = addLabel(
            position: CGPoint(x: model.menu.hamburgerMenu.createdByX, y: model.menu.hamburgerMenu.createdByY),
            size: 15,
            text: "CREATED BY: IAN BAKER")
        followMe = addLabel(
            position: CGPoint(x: model.menu.hamburgerMenu.followMeX, y: model.menu.hamburgerMenu.followMeY),
            size: 15,
            text: "FOLLOW ME ON TWITTER:")
        musicBy = addLabel(
            position: CGPoint(x: model.menu.hamburgerMenu.musicByX, y: model.menu.hamburgerMenu.musicByY),
            size: 15,
            text: "MUSIC BY:")
        inspiredBy = addLabel(
            position: CGPoint(x: model.menu.hamburgerMenu.inspiredByX, y: model.menu.hamburgerMenu.inspiredByY),
            size: 15,
            text: "INSPIRED BY: LUNAR LOCKOUT")

    }

    /**
     Initializes the hamburger menu links.
     */
    private func initializeLinks() {
        privacyPolicy = addLink(
            position: CGPoint(x: model.menu.hamburgerMenu.privacyPolicyX, y: model.menu.hamburgerMenu.privacyPolicyY),
            size: 15,
            text: "PRIVACY POLICY")
        twitterLink = addLink(
            position: CGPoint(x: model.menu.hamburgerMenu.twitterLinkX, y: model.menu.hamburgerMenu.twitterLinkY),
            size: 15,
            text: "@IANDEVSGAMES")
        musicLink = addLink(
            position: CGPoint(x: model.menu.hamburgerMenu.musicLinkX, y: model.menu.hamburgerMenu.musicLinkY),
            size: 15,
            text: "MILIEU")
        githubLink = addLink(
            position: CGPoint(x: model.menu.hamburgerMenu.githubLinkX, y: model.menu.hamburgerMenu.githubLinkY),
            size: 15,
            text: "VIEW SOURCE CODE ON GITHUB")
    }

    /**
     Adds a hamburger menu label.
     - Parameter position: The position of the label.
     - Parameter size: The size of the font.
     - Parameter text: The text of the label.
     - Parameter verticalAlignment: The vertical alignment of the label.
     - Returns: The newly added label.
     */
    private func addLabel(
        position: CGPoint,
        size: CGFloat,
        text: String,
        verticalAlignment: SKLabelVerticalAlignmentMode = SKLabelVerticalAlignmentMode.bottom
    ) -> SKLabelNode {
        let newLabel = SKLabelNode(fontNamed: "Lato-Regular")
        newLabel.zPosition = 101
        newLabel.position = position
        newLabel.fontSize = size
        newLabel.text = text
        newLabel.fontColor = SKColor.white
        newLabel.verticalAlignmentMode = verticalAlignment
        newLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        container.addChild(newLabel)
        return newLabel
    }

    /**
     Adds a hamburger menu link.
     - Parameter position: The position of the link.
     - Parameter size: The size of the font.
     - Parameter text: The text of the link.
     - Returns: The newly added link.
     */
    private func addLink(position: CGPoint, size: CGFloat, text: String) -> SKLabelNode {
        let attributedText = NSMutableAttributedString.init(string: text)
        let stringRange = NSRange(location: 0, length: attributedText.length)
        attributedText.beginEditing()
        attributedText.addAttributes([
            NSAttributedString.Key.foregroundColor: UIColor(red: 51/255, green: 102/255, blue: 187/255, alpha: 1),
            NSAttributedString.Key.font: UIFont.init(name: "Lato-Regular", size: size)!,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ], range: stringRange)
        attributedText.endEditing()

        let newLink = SKLabelNode(fontNamed: "Lato-Regular")
        newLink.zPosition = 101
        newLink.position = position
        newLink.attributedText = attributedText
        newLink.verticalAlignmentMode = SKLabelVerticalAlignmentMode.bottom
        newLink.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        container.addChild(newLink)
        return newLink
    }

    /**
     Initializes the hamburger menu volume controls.
     */
    private func initializeVolumeControls() {
        let linePath = CGMutablePath()
        linePath.move(to: CGPoint(x: 0, y: 0))
        linePath.addLine(to: CGPoint(x: model.menu.hamburgerMenu.volumeSliderWidth, y: 0))
        soundBar = SKShapeNode(path: linePath)
        soundBar.strokeColor = SKColor.white
        soundBar.lineWidth = 5
        soundBar.lineCap = CGLineCap.round
        soundBar.zPosition = 101
        soundBar.position = CGPoint(x: model.menu.hamburgerMenu.volumeSliderX, y: model.menu.hamburgerMenu.soundY)
        container.addChild(soundBar)
        soundCircle = SKShapeNode(circleOfRadius: CGFloat(model.menu.hamburgerMenu.volumeSliderCircleRadius))
        soundCircle.fillColor = SKColor.white
        soundCircle.zPosition = 101
        soundCircle.position = CGPoint(x: model.menu.hamburgerMenu.volumeSliderX, y: model.menu.hamburgerMenu.soundY)
        container.addChild(soundCircle)
        musicBar = SKShapeNode(path: linePath)
        musicBar.zPosition = 101
        musicBar.position = CGPoint(x: model.menu.hamburgerMenu.volumeSliderX, y: model.menu.hamburgerMenu.musicY)
        musicBar.strokeColor = SKColor.white
        musicBar.lineWidth = 5
        musicBar.lineCap = CGLineCap.round
        container.addChild(musicBar)
        musicCircle = SKShapeNode(circleOfRadius: CGFloat(model.menu.hamburgerMenu.volumeSliderCircleRadius))
        musicCircle.fillColor = SKColor.white
        musicCircle.zPosition = 101
        musicCircle.position = CGPoint(x: model.menu.hamburgerMenu.volumeSliderX, y: model.menu.hamburgerMenu.musicY)
        container.addChild(musicCircle)
    }
}
