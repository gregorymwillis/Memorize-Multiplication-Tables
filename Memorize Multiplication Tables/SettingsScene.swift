//
//  SettingsScene.swift
//  Memorize Multiplication Tables
//
//  Created by Greg Willis on 3/8/16.
//  Copyright © 2016 Willis Programming. All rights reserved.
//

import UIKit
import SpriteKit

class SettingsScene: SKScene {
    
    var backButton: UIBarButtonItem!
    
    override func didMoveToView(view: SKView) {
        backgroundColor = Colors.darkRedColor
        spawnBackButton()
    }
    
    func spawnBackButton() {
        let backButton = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: Selector("clickedDone:"))
        backButton.tintColor = Colors.offWhiteColor
        
        if let answerVC = GameViewController.controller {
            answerVC.navigationController?.setNavigationBarHidden(false, animated: true)
            answerVC.navigationController?.navigationBar.barTintColor = Colors.darkRedColor
            answerVC.navigationItem.leftBarButtonItem = backButton
        } else {
            assert(nil != GameViewController.controller, "GameViewController is nil")
        }
        
    }
    
    
    func clickedDone(sender: UIBarButtonItem) {
        transitionToGameScene()
    }
    
    func transitionToGameScene() {
        if let skView = view, scene = TitleScene(fileNamed: "TitleScene") {
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .ResizeFill
            skView.presentScene(scene, transition: SKTransition.crossFadeWithDuration(0.3))
        }
    }

}
