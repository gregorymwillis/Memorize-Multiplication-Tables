//
//  AnswerScene.swift
//  Memorize Multiplication Tables
//
//  Created by Greg Willis on 3/6/16.
//  Copyright © 2016 Willis Programming. All rights reserved.
//

import UIKit
import SpriteKit

class AnswerScene: SKScene {
    
    var answerNumber: Int!
    var backButton: UIBarButtonItem!

    override func didMoveToView(view: SKView) {
        backgroundColor = Colors.offBlackColor
        spawnAnswer()
        spawnBackButton()
    }
    
    func spawnAnswer() {
        
        
        let answer = SKLabelNode(fontNamed: "Avenir")
        answer.fontSize = 225
        answer.fontColor = Colors.darkRedColor
        
        answer.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        answer.text = "\(answerNumber)"
        
        addChild(answer)
        
    }
    
    func spawnBackButton() {
        let backButton = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: Selector("clickedDone:"))
        backButton.tintColor = Colors.offWhiteColor
        
        if let answerVC = GameViewController.controller {
            answerVC.navigationController?.setNavigationBarHidden(false, animated: true)
            answerVC.navigationController?.navigationBar.barTintColor = Colors.offBlackColor
            answerVC.navigationItem.leftBarButtonItem = backButton
        } else {
            assert(nil != GameViewController.controller, "GameViewController is nil")
        }
        
    }
    
    
    func clickedDone(sender: UIBarButtonItem) {
        transitionToGameScene()
    }

    func transitionToGameScene() {
        if let skView = view, scene = GameScene(fileNamed: "GameScene") {
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .ResizeFill
            skView.presentScene(scene, transition: SKTransition.crossFadeWithDuration(0.3))
        }
    }

}


