//
//  MenuPack.swift
//  Dillos
//
//  Created by PHISH3Y on 1/17/19.
//  Copyright © 2019 logSquaredX. All rights reserved.
//

import SpriteKit

class MenuPack: SKSpriteNode {
    
    private var currentScene: SKScene?
    
    private var levelPacksMenuOpen = false
    
    private var levelPacksB: SKSpriteNode?
    private var levelPacksBPressed = false
    private var levelPacksBTexture: SKTexture?
    private var levelPacksBPTexture: SKTexture?
    
    private var pack1B: PackButton?
    private var pack2BComingSoon: ComingSoonButton?
    private var pack3BComingSoon: ComingSoonButton?
    private var pack4BComingSoon: ComingSoonButton?
    private var pack5BComingSoon: ComingSoonButton?
    private var pack6BComingSoon: ComingSoonButton?
    private var pack7BComingSoon: ComingSoonButton?
    private var pack8BComingSoon: ComingSoonButton?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(scene: SKScene) {
        self.currentScene = scene
        let texture = SKTexture(imageNamed: "levelPackMenu.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initPosition()
        self.initSize()
        
        self.addLevelPacksB()
        
        self.levelPacksBTexture = SKTexture(imageNamed: "levelPacksB.png")
        self.levelPacksBPTexture = SKTexture(imageNamed: "levelPacksBP.png")
        
        self.initButtons()
    }
    
    func getLevelPacksMenuOpen() -> Bool {
        return self.levelPacksMenuOpen
    }
    
    func setLevelPacksMenuOpen(open: Bool) {
        self.levelPacksMenuOpen = open
    }
    
    func setLevelPacksBPressed(pressed: Bool) {
        self.levelPacksBPressed = pressed
    }
    
    func getLevelPackBPressed() -> Bool {
        return self.levelPacksBPressed
    }
    
    func getPack1B() -> PackButton {
        return self.pack1B!
    }
    
    func touchLevelPacksB(touchLocation: CGPoint, levelMenuOpen: Bool, leaderboardOpen: Bool) {
        if(self.levelPacksB!.contains(touchLocation) && !self.levelPacksMenuOpen && !levelMenuOpen && !Locker.getButtonLock() && !leaderboardOpen) {
            self.levelPacksBPressed = true
            Animation.changeMenuButtonsAnimation(texture: self.levelPacksBPTexture!)
            self.levelPacksB!.run(Animation.getMenuButtonsAnimation())
        }
    }
    
    func releaseLevelPacksB(closeButton: SKSpriteNode) {
        if(self.levelPacksBPressed) {
            self.levelPacksBPressed = false
            self.currentScene!.addChild(closeButton)
            self.openPackMenu()
        }
    }
    
    func openPackMenu() {
        self.currentScene!.addChild(self)
        
        Animation.changeMenuButtonsAnimation(texture: self.levelPacksBTexture!)
        self.levelPacksB!.run(Animation.getMenuButtonsAnimation())

        // add buttons
        self.scene!.addChild(self.pack1B!)
        self.scene!.addChild(self.pack2BComingSoon!)
        self.scene!.addChild(self.pack3BComingSoon!)
        self.scene!.addChild(self.pack4BComingSoon!)
        self.scene!.addChild(self.pack5BComingSoon!)
        self.scene!.addChild(self.pack6BComingSoon!)
        self.scene!.addChild(self.pack7BComingSoon!)
        self.scene!.addChild(self.pack8BComingSoon!)
        self.levelPacksMenuOpen = true
    }
    
    func closePackmenu(closeButton: SKSpriteNode) {
        if(self.levelPacksMenuOpen) {
            closeButton.removeFromParent()
            self.removeFromParent()
            self.pack1B!.removeFromParent()
            self.pack2BComingSoon!.removeFromParent()
            self.pack3BComingSoon!.removeFromParent()
            self.pack4BComingSoon!.removeFromParent()
            self.pack5BComingSoon!.removeFromParent()
            self.pack6BComingSoon!.removeFromParent()
            self.pack7BComingSoon!.removeFromParent()
            self.pack8BComingSoon!.removeFromParent()
            self.levelPacksMenuOpen = false
        }
    }
    
    func touchPack1B(touchLocation: CGPoint) {
        if(self.levelPacksMenuOpen && self.pack1B!.contains(touchLocation) && !Locker.getButtonLock()) {
            self.pack1B!.touchBegin()
        }
    }
    
    private func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * 0.0, y: Screen.screen!.height * -0.238)
        self.zPosition = 0.3
    }
    
    private func initSize() {
        self.size = CGSize(width: Screen.screen!.width * 0.93, height: Screen.screen!.height * 0.411)
    }
    
    private func addLevelPacksB() {
        self.levelPacksB = SKSpriteNode(imageNamed: "levelPacksB.png")
        self.levelPacksB!.size = CGSize(width: (self.levelPacksB!.size.width/2208) * Screen.screen!.width, height: (self.levelPacksB!.size.height/1242) * Screen.screen!.height)
        self.levelPacksB!.position = CGPoint(x: Screen.screen!.width * -0.35, y: Screen.screen!.height * -0.333)
        self.levelPacksB!.zPosition = 0.2
        self.currentScene!.addChild(self.levelPacksB!)
    }
    
    private func initButtons() {
        // all the pack buttons
        self.pack1B = PackButton(img: "pack1B.png", pack: "pack1", posX: -0.346, posY: -0.14)
        self.pack2BComingSoon = ComingSoonButton(posX: -0.1273, posY: -0.14)
        self.pack3BComingSoon = ComingSoonButton(posX: 0.0889, posY: -0.14)
        self.pack4BComingSoon = ComingSoonButton(posX: 0.3067, posY: -0.14)
        self.pack5BComingSoon = ComingSoonButton(posX: -0.3435, posY: -0.334)
        self.pack6BComingSoon = ComingSoonButton(posX: -0.1273, posY: -0.334)
        self.pack7BComingSoon = ComingSoonButton(posX: 0.0889, posY: -0.334)
        self.pack8BComingSoon = ComingSoonButton(posX: 0.3067, posY: -0.334)
    }
}
