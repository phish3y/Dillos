//
//  GameViewController.swift
//  Dillos
//
//  Created by PHISH3Y on 1/5/19.
//  Copyright © 2019 logSquaredX. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import GoogleMobileAds

class GameViewController: UIViewController, GADBannerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = Menu(fileNamed: "Menu") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .resizeFill
                
                Animation.loadImages()
                self.initAd()
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            // debugging
            view.showsFPS = false
            view.showsNodeCount = false
            view.showsPhysics = true
        }
    }
    
    /* I can't believe this
    // makes the touch delay we had at the bottom of the screen go away
    // whew
    override func viewDidAppear(_ animated: Bool) {
        let window = view.window!
        let gr0 = window.gestureRecognizers![0] as UIGestureRecognizer
        let gr1 = window.gestureRecognizers![1] as UIGestureRecognizer
        gr0.delaysTouchesBegan = false
        gr1.delaysTouchesBegan = false
    }
 */

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        // only play in landscape
        return .landscape
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    static var adBanner: GADBannerView?
    
    func initAd() {
        GameViewController.adBanner = GADBannerView(adSize: kGADAdSizeBanner)
        GameViewController.adBanner!.frame = CGRect(x: 0.0, y: 0.0, width: self.view!.frame.width, height: (self.view!.frame.height * 0.15) + 4)
        GameViewController.adBanner!.delegate = self
        // test: ca-app-pub-3940256099942544/2934735716
        // prod: ca-app-pub-2881954843051971/1361526207
        GameViewController.adBanner!.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        GameViewController.adBanner!.rootViewController = self
    }
    
    static func pullNewAd() {
        GameViewController.adBanner!.load(GADRequest())
    }
}
