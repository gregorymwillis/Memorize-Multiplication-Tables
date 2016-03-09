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
    let answerVC = GameViewController.controller

    override func didMoveToView(view: SKView) {
        backgroundColor = Colors.offBlackColor
        spawnAnswer()
        waitThenTransition()
        backButton.title = "Back"
        backButton.target = self
        backButton.action = "clickedDone"
        backButton.style = .Plain
        
        answerVC?.navigationController?.setNavigationBarHidden(false, animated: false)
        answerVC?.navigationController?.setToolbarItems([backButton], animated: false)
    }
    
    func spawnAnswer() {
        
        
        let answer = SKLabelNode(fontNamed: "Avenir")
        answer.fontSize = 225
        answer.fontColor = Colors.darkRedColor
        
        answer.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        answer.text = "\(answerNumber)"
        
        addChild(answer)
        
    }
    
    func waitThenTransition() {
        
        let wait = SKAction.waitForDuration(4)
        let transition = SKAction.runBlock {
            if let scene = GameScene(fileNamed: "GameScene") {
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .ResizeFill
                skView.presentScene(scene)
            }
        }
        runAction(SKAction.sequence([wait, transition]))
    }

    func clickedDone(sender: UIBarButtonItem) {
        answerVC!.navigationController?.popViewControllerAnimated(true)
    }

}


