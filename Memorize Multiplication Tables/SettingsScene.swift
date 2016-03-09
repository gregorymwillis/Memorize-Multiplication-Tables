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
    var multiNumberSettingLabel: UILabel!
    var multiNumberSettingTextField: UITextField!
    
    var multiNumberSetting: Int!
    
    
    override func didMoveToView(view: SKView) {
        backgroundColor = Colors.darkRedColor
        spawnBackButton()
        multiNumberSettingLabel = spawnMultiNumberSettingLabel()
        multiNumberSettingTextField = spawnMultiNumberSettingTextField()
    }
}

// MARK: - Spawn functions
extension SettingsScene {
    
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
    
    func spawnMultiNumberSettingLabel() -> UILabel {
        multiNumberSettingLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        if let multiNumberSettingLabel = multiNumberSettingLabel {
            multiNumberSettingLabel.textColor = Colors.offWhiteColor
            multiNumberSettingLabel.font = UIFont(name: "Futura", size: 20)
            multiNumberSettingLabel.center = CGPoint(x: CGRectGetMaxX(self.frame) * 0.4, y: CGRectGetMaxY(self.frame) * 0.11)
            multiNumberSettingLabel.textAlignment = .Left
            multiNumberSettingLabel.text = "Set Multiplication Number"
            view!.addSubview(multiNumberSettingLabel)
        }
        return multiNumberSettingLabel
    }
    
    func spawnMultiNumberSettingTextField() -> UITextField {
        multiNumberSettingTextField = UITextField(frame: CGRect(x: CGRectGetMaxX(self.frame) * 0.8, y: CGRectGetMaxY(self.frame) * 0.1, width: 40, height: 20))
        if let multiNumberSettingTextField = multiNumberSettingTextField {
            multiNumberSettingTextField.backgroundColor = Colors.offWhiteColor
            view?.addSubview(multiNumberSettingTextField)
        }

        multiNumberSetting = Int(multiNumberSettingTextField.text!) ?? nil
        return multiNumberSettingTextField
    }
}

// MARK: - Helper functions
extension SettingsScene {
    
    func clickedDone(sender: UIBarButtonItem) {
        transitionToGameScene()
    }
    
    func transitionToGameScene() {
        multiNumberSettingLabel.removeFromSuperview()
        multiNumberSettingTextField.removeFromSuperview()
        
        if let skView = view, scene = TitleScene(fileNamed: "TitleScene") {
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .ResizeFill
            skView.presentScene(scene, transition: SKTransition.crossFadeWithDuration(0.3))
        }
    }

}
