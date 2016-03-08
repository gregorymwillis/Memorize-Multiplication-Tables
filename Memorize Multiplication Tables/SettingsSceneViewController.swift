//
//  SettingsSceneViewController.swift
//  Memorize Multiplication Tables
//
//  Created by Greg Willis on 3/8/16.
//  Copyright © 2016 Willis Programming. All rights reserved.
//

import UIKit
import SpriteKit

class SettingsSceneViewController: UIViewController {
    
    @IBOutlet var backButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func goToTitleScene() {
        
    }
}


// MARK: - IBActions 

extension SettingsSceneViewController {
    
    @IBAction func clickedDone(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }
}

