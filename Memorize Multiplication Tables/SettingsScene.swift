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
    var multiplierSettingLabel: UILabel!
    var multiplierSettingTextField: UITextField!
    
    var multiplierSetting: Int? = nil
    
    
    override func didMoveToView(view: SKView) {
        backgroundColor = Colors.darkRedColor
        spawnBackButton()
        multiplierSettingLabel = spawnMultiplierSettingLabel()
        multiplierSettingTextField = spawnMultiplierSettingTextField()
        getUserDefaults()
    }
    
    override func willMoveFromView(view: SKView) {
        setUserDefaults()

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
    
    func spawnMultiplierSettingLabel() -> UILabel {
        multiplierSettingLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        if let multiplierSettingLabel = multiplierSettingLabel {
            multiplierSettingLabel.textColor = Colors.offWhiteColor
            multiplierSettingLabel.font = UIFont(name: "Futura", size: 20)
            multiplierSettingLabel.center = CGPoint(x: CGRectGetMaxX(self.frame) * 0.4, y: CGRectGetMaxY(self.frame) * 0.11)
            multiplierSettingLabel.textAlignment = .Left
            multiplierSettingLabel.text = "Set Multiplier"
            view!.addSubview(multiplierSettingLabel)
        }
        return multiplierSettingLabel
    }
    
    func spawnMultiplierSettingTextField() -> UITextField {
        multiplierSettingTextField = UITextField(frame: CGRect(x: CGRectGetMaxX(self.frame) * 0.8, y: CGRectGetMaxY(self.frame) * 0.1, width: 40, height: 20))
        if let multiplierSettingTextField = multiplierSettingTextField {
            multiplierSettingTextField.backgroundColor = Colors.offWhiteColor
            view?.addSubview(multiplierSettingTextField)
        }

        return multiplierSettingTextField
    }
}

// MARK: - User Default functions
extension SettingsScene {
    
    func setUserDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if multiplierSettingTextField.text == "" {
            defaults.setValue(nil, forKey: "multiplierSetting")
        } else {
            multiplierSetting = Int(multiplierSettingTextField.text!)
            defaults.setValue(multiplierSetting, forKey: "multiplierSetting")
        }
        
    }
    
    func getUserDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        multiplierSetting = Int(defaults.integerForKey("multiplierSetting"))
        
        if multiplierSetting == nil {
            multiplierSettingTextField.text = ""
        } else {
            multiplierSettingTextField.text = "\(multiplierSetting)"
        }
        
        
    }
}

// MARK: - Helper functions
extension SettingsScene {
    
    func clickedDone(sender: UIBarButtonItem) {
        transitionToGameScene()
    }
    
    func transitionToGameScene() {
        multiplierSettingLabel.removeFromSuperview()
        multiplierSettingTextField.removeFromSuperview()
        
        if let skView = view, scene = TitleScene(fileNamed: "TitleScene") {
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .ResizeFill
            skView.presentScene(scene, transition: SKTransition.crossFadeWithDuration(0.3))
        }
    }

}
