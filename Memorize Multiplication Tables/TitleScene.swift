//
//  TitleScene.swift
//  Memorize Multiplication Tables
//
//  Created by Greg Willis on 3/8/16.
//  Copyright © 2016 Willis Programming. All rights reserved.
//

import Foundation
import SpriteKit

class TitleScene: SKScene {
    
    var playButton: UIButton!
    var settingsButton: UIButton!
    var gameTitle: UILabel!
    
    override func didMoveToView(view: SKView) {
        backgroundColor = Colors.darkRedColor
        spawnGameTitle()
        spawnPlayButton()
        spawnSettingsButton()
    }
}

// MARK: - Spawn functions
extension TitleScene {
    
    func spawnGameTitle() {
        gameTitle = UILabel(frame: CGRect(x: 0, y: 0, width: view!.frame.width, height: view!.frame.height * 0.4))
        if let gameTitle = gameTitle {
            gameTitle.textColor = Colors.offWhiteColor
            gameTitle.font = UIFont(name: "Futura", size: 50)
            gameTitle.textAlignment = .Center
            gameTitle.numberOfLines = 0
            gameTitle.text = "Memorize Your Multiplication Tables"
            view!.addSubview(gameTitle)
        }
    }
    
    func spawnPlayButton() {
        if let view = view {
            playButton = UIButton(frame: CGRect(x: 100, y: 100, width: 160, height: 80))
            if let playButton = playButton {
                playButton.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height * 0.7)
                playButton.backgroundColor = Colors.offBlackColor
                playButton.layer.cornerRadius = 10
                playButton.layer.borderWidth = 2.0
                playButton.layer.borderColor = Colors.offWhiteColor.CGColor
                playButton.titleLabel?.font = UIFont(name: "Futura", size: 40)
                playButton.setTitle("Play", forState: .Normal)
                playButton.setTitleColor(Colors.offWhiteColor, forState: .Normal)
                playButton.addTarget(self, action: Selector("playTheGame"), forControlEvents: .TouchUpInside)
                view.addSubview(playButton)
            }
        }
    }
    
    func spawnSettingsButton() {
        if let view = view {
            settingsButton = UIButton(frame: CGRect(x: 100, y: 100, width: 160, height: 80))
            if let settingsButton = settingsButton {
                settingsButton.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height * 0.9)
                
                settingsButton.titleLabel?.font = UIFont(name: "Futura", size: 40)
                settingsButton.setTitle("Settings", forState: .Normal)
                settingsButton.setTitleColor(Colors.offBlackColor, forState: .Normal)
                settingsButton.addTarget(self, action: Selector("goToSettings"), forControlEvents: .TouchUpInside)
                view.addSubview(settingsButton)
            }
        }
    }
}

// MARK: - Helper functions
extension TitleScene {
    
    func playTheGame() {
        if let view = view {
            playButton?.removeFromSuperview()
            gameTitle.removeFromSuperview()
            settingsButton.removeFromSuperview()
            
            if let gameScene = GameScene(fileNamed: "GameScene") {
                view.ignoresSiblingOrder = true
                gameScene.scaleMode = .ResizeFill
                view.presentScene(gameScene, transition: SKTransition.crossFadeWithDuration(1))
            }
        }
        
    }
    
    func goToSettings() {
        if let controller = GameViewController.controller, navigationController = controller.navigationController {
            let settingsVC = UIStoryboard(name: "Settings", bundle: nil).instantiateViewControllerWithIdentifier("Settings")
            navigationController.pushViewController(settingsVC, animated: true)
        }
    }
}