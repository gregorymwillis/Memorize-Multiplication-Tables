//
//  GameScene.swift
//  Memorize Multiplication Tables
//
//  Created by Greg Willis on 3/6/16.
//  Copyright (c) 2016 Willis Programming. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    var answerButton: UIButton!
    
    override func didMoveToView(view: SKView) {
        backgroundColor = Colors.darkRedColor
        spawnNumber()
        spawnTimesOperator()
        spawnAnswerButton()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {

    }
}

// MARK: - Spawn Functions
extension GameScene {
    
    func spawnNumber() {
        createNumber(CGPoint(x: CGRectGetWidth(self.frame) * 0.6, y: CGRectGetHeight(self.frame) * 0.65))
        createNumber(CGPoint(x: CGRectGetWidth(self.frame) * 0.6, y: CGRectGetHeight(self.frame) * 0.3))
        
    }
    
    func spawnTimesOperator() -> SKLabelNode {
        let timesOperator = SKLabelNode(fontNamed: "Avenir")
        timesOperator.fontSize = 150
        timesOperator.fontColor = Colors.offWhiteColor
        timesOperator.position = CGPoint(x: CGRectGetWidth(self.frame) * 0.22, y: CGRectGetHeight(self.frame) * 0.3)
        timesOperator.text = "X"
        addChild(timesOperator)
        
        return timesOperator
    }
    
    func spawnAnswerButton() {
        let answerButton = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 70))
        answerButton.center = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetHeight(self.frame) * 0.85)
        answerButton.backgroundColor = Colors.offBlackColor
        answerButton.layer.cornerRadius = 10
        answerButton.layer.borderWidth = 2.0
        answerButton.layer.borderColor = Colors.offWhiteColor.CGColor
        answerButton.titleLabel?.font = UIFont(name: "Avenir", size: 50)
        answerButton.setTitle("Answer", forState: UIControlState.Normal)
        answerButton.setTitleColor(Colors.offWhiteColor, forState: UIControlState.Normal)
        answerButton.addTarget(self, action: Selector("goToAnswer"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view?.addSubview(answerButton)
    }
}

// MARK: - Helper Functions
extension GameScene {
    
    func createNumber(position: CGPoint) -> SKLabelNode {
        let number = SKLabelNode(fontNamed: "Avenir")
        number.fontSize = 225
        number.fontColor = Colors.offWhiteColor
        
        number.position = position
        number.text = "1"
        
        addChild(number)
        
        return number
    }
    
    func goToAnswer() {
        if let view = view {
            view.presentScene(AnswerScene(), transition: SKTransition.crossFadeWithDuration(0.2))
            answerButton?.removeFromSuperview()
        
            if let scene = AnswerScene(fileNamed: "AnswerScene") {
                let skView = self.view! as SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .ResizeFill
                skView.presentScene(scene)
            }
        }
    }
    
}
