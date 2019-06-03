//
//  Menu.swift
//  Dillos
//
//  dillos menu screen
//
//  Created by PHISH3Y on 1/5/19.
//  Copyright © 2019 logSquaredX. All rights reserved.
//

import SpriteKit

class Menu: SKScene, UITextFieldDelegate, SKPhysicsContactDelegate {
    
    var packMenu: MenuPack?
    
    // okay
    var okayPrompt: OkayPrompt?
    var okayButton: OkayButton?
    var okayPromptOpen = false
    
    // main screen buttons
    var playButton: PlayButton?
    var optionsButton: OptionsButton?
    var optionsButtonGrey: GreySquareButton?
    var optionsButtonPressed = false
    
    // close button (or go back button)
    var close: SKSpriteNode?
    var closeButtonPressed = false
    
    // level menu and buttons
    var levelMenu: SKSpriteNode?
    var levelMenuOpen = false

    // level 1 button
    var level1B: LevelButton?
    var pack1Level1Saved: SKLabelNode?
    var div81: SKSpriteNode?
    
    // level 2 button
    var level2B: LevelButton?
    var level2BGrey: GreySquareButton?
    var pack1Level2Saved: SKLabelNode?
    var div82: SKSpriteNode?

    // level 3 button
    var level3B: LevelButton?
    var level3BGrey: GreySquareButton?
    var pack1Level3Saved: SKLabelNode?
    var div83: SKSpriteNode?
    
    // level 4 button
    var level4B: LevelButton?
    var level4BGrey: GreySquareButton?
    var pack1Level4Saved: SKLabelNode?
    var div84: SKSpriteNode?
    
    // level 5 button
    var level5B: LevelButton?
    var level5BGrey: GreySquareButton?
    var pack1Level5Saved: SKLabelNode?
    var div85: SKSpriteNode?
    
    // level 6 button
    var level6B: LevelButton?
    var level6BGrey: GreySquareButton?
    var pack1Level6Saved: SKLabelNode?
    var div86: SKSpriteNode?
    
    // level 7 button
    var level7B: LevelButton?
    var level7BGrey: GreySquareButton?
    var pack1Level7Saved: SKLabelNode?
    var div87: SKSpriteNode?
    
    // level 8 button
    var level8B: LevelButton?
    var level8BGrey: GreySquareButton?
    var pack1Level8Saved: SKLabelNode?
    var div88: SKSpriteNode?
    
    // menu animations
    var dillo: Dillo?
    var spring: Spring?
    var deathBarrier: DeathBarrier?
    var dilloDied = false
    var floatingGround: SKSpriteNode?
    
    var leaderboard: Leaderboard?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        // sets CGRect of screen to use for sizing graphics
        Screen.setScreen(screen: self.frame)
        // button lock is used to make sure a user
        // cannot press a button while it is already pressed
        Locker.resetButtonLock()
        
        // background
        let background = SKSpriteNode(imageNamed: "menu1.png")
        background.size = CGSize(width: Screen.screen!.width, height: Screen.screen!.height)
        background.position = CGPoint(x: Screen.screen!.width * 0, y: Screen.screen!.height * 0)
        background.zPosition = 0.0
        self.addChild(background)
        
        // another background piece
        let background3 = SKSpriteNode(imageNamed: "menu3.png")
        background3.size = CGSize(width: Screen.screen!.width + 2, height: Screen.screen!.height * 0.55)
        background3.position = CGPoint(x: Screen.screen!.width * 0.0, y: Screen.screen!.minY + background3.size.height/2 - 2)
        background3.zPosition = 0.1
        self.addChild(background3)
        
        // ground
        self.floatingGround = SKSpriteNode(imageNamed: "menu2.png")
        self.floatingGround!.size = CGSize(width: Screen.screen!.width * 0.6, height: Screen.screen!.height * 0.065)
        self.floatingGround!.position = CGPoint(x: Screen.screen!.width * -0.26, y: Screen.screen!.height * 0.064)
        self.floatingGround!.zPosition = 0.05
        self.floatingGround!.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "menu2.png"), size: self.floatingGround!.size)
        self.floatingGround!.physicsBody!.isDynamic = false
        self.floatingGround!.physicsBody!.allowsRotation = false
        self.floatingGround!.physicsBody!.categoryBitMask = CollisionType.getGround()
        self.floatingGround!.physicsBody!.restitution = 0.0
        self.floatingGround!.physicsBody!.friction = 0.0
        self.addChild(self.floatingGround!)
        
        // figure out which level the user is currently on
        let currentLevel = self.getCurrentLevel()
        
        // pack menu
        self.packMenu = MenuPack(scene: self.scene!)
        
        // play button
        self.playButton = PlayButton(level: currentLevel, posX: -0.35, posY: -0.14, view: self.view!)
        self.addChild(self.playButton!)
        
        self.leaderboard = Leaderboard(scene: self)
        
        // options button
        self.optionsButton = OptionsButton(posX: 0.351, posY: -0.142)
        self.addChild(self.optionsButton!)
        self.optionsButtonGrey = GreySquareButton(posX: 0.351, posY: -0.142)
        self.optionsButtonGrey!.zPosition = 0.21
        self.addChild(self.optionsButtonGrey!)
        
        // close (or go back) button
        self.close = SKSpriteNode(imageNamed: "close.png")
        self.close!.size = CGSize(width: Screen.screen!.width * 0.05, height: Screen.screen!.height * 0.08)
        self.close!.position = CGPoint(x: Screen.screen!.width * 0.432, y: Screen.screen!.height * -0.08)
        self.close!.zPosition = 0.7
        
        // menu that comes up to display levels
        self.levelMenu = SKSpriteNode(imageNamed: "levelPackMenu.png")
        self.levelMenu!.size = CGSize(width: Screen.screen!.width * 0.93, height: Screen.screen!.height * 0.411)
        self.levelMenu!.position = CGPoint(x: Screen.screen!.width * 0.0, y: Screen.screen!.height * -0.238)
        self.levelMenu!.zPosition = 0.5
            
        // level 1 button
        self.level1B = LevelButton(img: "level1B.png", level: "Level1", posX: -0.346, posY: -0.14, view: self.view!)
        
        self.pack1Level1Saved = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        self.pack1Level1Saved!.text = String(UserData.getScore(level: 1))
        self.pack1Level1Saved!.position = CGPoint(x: Screen.screen!.width * -0.2825, y: Screen.screen!.height * -0.103)
        self.pack1Level1Saved!.fontSize = CGFloat(Screen.screen!.width * 0.025)
        self.pack1Level1Saved!.zPosition = 0.7
            
        if(UserData.getScore(level: 1) == 8) {
            self.div81 = SKSpriteNode(imageNamed: "8g.png")
            self.pack1Level1Saved!.fontColor = SKColor.init(red: 57.0/255.0, green: 181/255.0, blue: 74/255.0, alpha: 1.0)
        } else {
            self.div81 = SKSpriteNode(imageNamed: "8r.png")
            self.pack1Level1Saved!.fontColor = SKColor.red
        }
        self.div81!.size = CGSize(width: Screen.screen!.width * 0.03, height: Screen.screen!.height * 0.06)
        self.div81!.position = CGPoint(x: Screen.screen!.width * -0.268, y: Screen.screen!.height * -0.11)
        self.div81!.zPosition = 0.7
        
        // level 2 button
        self.level2B = LevelButton(img: "level2B.png", level: "Level2", posX: -0.13, posY: -0.14, view: self.view!)
        self.level2BGrey = GreySquareButton(posX: -0.13, posY: -0.14)
            
        self.pack1Level2Saved = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        self.pack1Level2Saved!.text = String(UserData.getScore(level: 2))
        self.pack1Level2Saved!.position = CGPoint(x: Screen.screen!.width * -0.066, y: Screen.screen!.height * -0.103)
        self.pack1Level2Saved!.fontSize = CGFloat(Screen.screen!.width * 0.025)
        self.pack1Level2Saved!.zPosition = 0.7
            
        if(UserData.getScore(level: 2) == 8) {
            self.div82 = SKSpriteNode(imageNamed: "8g.png")
            self.pack1Level2Saved!.fontColor = SKColor.init(red: 57.0/255.0, green: 181/255.0, blue: 74/255.0, alpha: 1.0)
        } else {
            self.div82 = SKSpriteNode(imageNamed: "8r.png")
            self.pack1Level2Saved!.fontColor = SKColor.red
        }
        self.div82!.size = CGSize(width: Screen.screen!.width * 0.03, height: Screen.screen!.height * 0.06)
        self.div82!.position = CGPoint(x: Screen.screen!.width * -0.052, y: Screen.screen!.height * -0.11)
        self.div82!.zPosition = 0.7
            
        // level 3 button
        self.level3B = LevelButton(img: "level3B.png", level: "Level3", posX: 0.0862, posY: -0.14, view: self.view!)
        self.level3BGrey = GreySquareButton(posX: 0.0862, posY: -0.14)
            
        self.pack1Level3Saved = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        self.pack1Level3Saved!.text = String(UserData.getScore(level: 3))
        self.pack1Level3Saved!.position = CGPoint(x: Screen.screen!.width * 0.15, y: Screen.screen!.height * -0.103)
        self.pack1Level3Saved!.fontSize = CGFloat(Screen.screen!.width * 0.025)
        self.pack1Level3Saved!.zPosition = 0.7
            
        if(UserData.getScore(level: 3) == 8) {
            self.div83 = SKSpriteNode(imageNamed: "8g.png")
            self.pack1Level3Saved!.fontColor = SKColor.init(red: 57.0/255.0, green: 181/255.0, blue: 74/255.0, alpha: 1.0)
        } else {
            self.div83 = SKSpriteNode(imageNamed: "8r.png")
            self.pack1Level3Saved!.fontColor = SKColor.red
        }
        self.div83!.size = CGSize(width: Screen.screen!.width * 0.03, height: Screen.screen!.height * 0.06)
        self.div83!.position = CGPoint(x: Screen.screen!.width * 0.164, y: Screen.screen!.height * -0.11)
        self.div83!.zPosition = 0.7
            
            // level 4 button
        self.level4B = LevelButton(img: "level4B.png", level: "Level4", posX: 0.304, posY: -0.14, view: self.view!)
        self.level4BGrey = GreySquareButton(posX: 0.304, posY: -0.14)
            
        self.pack1Level4Saved = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        self.pack1Level4Saved!.text = String(UserData.getScore(level: 4))
        self.pack1Level4Saved!.position = CGPoint(x: Screen.screen!.width * 0.368, y: Screen.screen!.height * -0.103)
        self.pack1Level4Saved!.fontSize = CGFloat(Screen.screen!.width * 0.025)
        self.pack1Level4Saved!.zPosition = 0.7
            
        if(UserData.getScore(level: 4) == 8) {
            self.div84 = SKSpriteNode(imageNamed: "8g.png")
            self.pack1Level4Saved!.fontColor = SKColor.init(red: 57.0/255.0, green: 181.0/255.0, blue: 74.0/255.0, alpha: 1.0)
        } else {
            self.div84 = SKSpriteNode(imageNamed: "8r.png")
            self.pack1Level4Saved!.fontColor = SKColor.red
        }
        self.div84!.size = CGSize(width: Screen.screen!.width * 0.03, height: Screen.screen!.height * 0.06)
        self.div84!.position = CGPoint(x: Screen.screen!.width * 0.382, y: Screen.screen!.height * -0.11)
        self.div84!.zPosition = 0.7
            
        // level 5 button
        self.level5B = LevelButton(img: "level5B.png", level: "Level5", posX: -0.346, posY: -0.334, view: self.view!)
        self.level5BGrey = GreySquareButton(posX: -0.346, posY: -0.334)
            
        self.pack1Level5Saved = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        self.pack1Level5Saved!.text = String(UserData.getScore(level: 5))
        self.pack1Level5Saved!.position = CGPoint(x: Screen.screen!.width * -0.2825, y: Screen.screen!.height * -0.302)
        self.pack1Level5Saved!.fontSize = CGFloat(Screen.screen!.width * 0.025)
        self.pack1Level5Saved!.zPosition = 0.7
            
        if(UserData.getScore(level: 5) == 8) {
            self.div85 = SKSpriteNode(imageNamed: "8g.png")
            self.pack1Level5Saved!.fontColor = SKColor.init(red: 57.0/255.0, green: 181.0/255.0, blue: 74.0/255.0, alpha: 1.0)
        } else {
            self.div85 = SKSpriteNode(imageNamed: "8r.png")
            self.pack1Level5Saved!.fontColor = SKColor.red
        }
        self.div85!.size = CGSize(width: Screen.screen!.width * 0.03, height: Screen.screen!.height * 0.06)
        self.div85!.position = CGPoint(x: Screen.screen!.width * -0.268, y: Screen.screen!.height * -0.31)
        self.div85!.zPosition = 0.7
            
        // level 6 button
        self.level6B = LevelButton(img: "level6B.png", level: "Level6", posX: -0.13, posY: -0.334, view: self.view!)
        self.level6BGrey = GreySquareButton(posX: -0.13, posY: -0.334)
            
        self.pack1Level6Saved = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        self.pack1Level6Saved!.text = String(UserData.getScore(level: 6))
        self.pack1Level6Saved!.position = CGPoint(x: Screen.screen!.width * -0.066, y: Screen.screen!.height * -0.302)
        self.pack1Level6Saved!.fontSize = CGFloat(Screen.screen!.width * 0.025)
        self.pack1Level6Saved!.fontColor = SKColor.red
        self.pack1Level6Saved!.zPosition = 0.7
            
        if(UserData.getScore(level: 6) == 8) {
            self.div86 = SKSpriteNode(imageNamed: "8g.png")
            self.pack1Level6Saved!.fontColor = SKColor.init(red: 57.0/255.0, green: 181.0/255.0, blue: 74.0/255.0, alpha: 1.0)
        } else {
            self.div86 = SKSpriteNode(imageNamed: "8r.png")
            self.pack1Level6Saved!.fontColor = SKColor.red
        }
        self.div86!.size = CGSize(width: Screen.screen!.width * 0.03, height: Screen.screen!.height * 0.06)
        self.div86!.position = CGPoint(x: Screen.screen!.width * -0.052, y: Screen.screen!.height * -0.31)
        self.div86!.zPosition = 0.7
            
        // level 7 button
        self.level7B = LevelButton(img: "level7B.png", level: "Level7", posX: 0.0862, posY: -0.334, view: self.view!)
        self.level7BGrey = GreySquareButton(posX: 0.0862, posY: -0.334)
            
        self.pack1Level7Saved = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        self.pack1Level7Saved!.text = String(UserData.getScore(level: 7))
        self.pack1Level7Saved!.position = CGPoint(x: Screen.screen!.width * 0.15, y: Screen.screen!.height * -0.302)
        self.pack1Level7Saved!.fontSize = CGFloat(Screen.screen!.width * 0.025)
        self.pack1Level7Saved!.zPosition = 0.7
            
        if(UserData.getScore(level: 7) == 8) {
            self.div87 = SKSpriteNode(imageNamed: "8g.png")
            self.pack1Level7Saved!.fontColor = SKColor.init(red: 57.0/255.0, green: 181.0/255.0, blue: 74.0/255.0, alpha: 1.0)
        } else {
            self.div87 = SKSpriteNode(imageNamed: "8r.png")
            self.pack1Level7Saved!.fontColor = SKColor.red
        }
        self.div87!.size = CGSize(width: Screen.screen!.width * 0.03, height: Screen.screen!.height * 0.06)
        self.div87!.position = CGPoint(x: Screen.screen!.width * 0.164, y: Screen.screen!.height * -0.31)
        self.div87!.zPosition = 0.7
            
        // level 8 button
        self.level8B = LevelButton(img: "level8B.png", level: "Level8", posX: 0.304, posY: -0.334, view: self.view!)
        self.level8BGrey = GreySquareButton(posX: 0.304, posY: -0.334)
            
        self.pack1Level8Saved = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        self.pack1Level8Saved!.text = String(UserData.getScore(level: 8))
        self.pack1Level8Saved!.position = CGPoint(x: Screen.screen!.width * 0.368, y: Screen.screen!.height * -0.302)
        self.pack1Level8Saved!.fontSize = CGFloat(Screen.screen!.width * 0.025)
        self.pack1Level8Saved!.zPosition = 0.7
            
        if(UserData.getScore(level: 8) == 8) {
            self.div88 = SKSpriteNode(imageNamed: "8g.png")
            self.pack1Level8Saved!.fontColor = SKColor.init(red: 57.0/255.0, green: 181.0/255.0, blue: 74.0/255.0, alpha: 1.0)
        } else {
            self.div88 = SKSpriteNode(imageNamed: "8r.png")
            self.pack1Level8Saved!.fontColor = SKColor.red
        }
        self.div88!.size = CGSize(width: Screen.screen!.width * 0.03, height: Screen.screen!.height * 0.06)
        self.div88!.position = CGPoint(x: Screen.screen!.width * 0.382, y: Screen.screen!.height * -0.31)
        self.div88!.zPosition = 0.7
        
        self.dillo = Dillo(posX: -0.48, posY: 1.2, zPos: 1.0, name: "dillo")
        self.addChild(self.dillo!)
        self.spring = Spring(name: "spring1", zPosition: 0.25)
        self.spring!.position = CGPoint(x: Screen.screen!.width * 0.0, y: Screen.screen!.height * 0.105)
        self.addChild(self.spring!)
        self.deathBarrier = DeathBarrier(sizeX: Screen.screen!.width * 0.1, posX: 0.1, posY: 0.03)
        self.addChild(self.deathBarrier!)
        
        self.physicsWorld.gravity.dy = -5.0
        physicsWorld.contactDelegate = self
    }
    
    /**
        calculates the latest level the user has unlocked
     */
    private func getCurrentLevel() -> Int {
        var currentLevel = 1
            if(UserData.getScore(level: 8) > 0 || UserData.getScore(level: 7) > 0) {
                currentLevel = 8
            } else if(UserData.getScore(level: 6) > 0) {
                currentLevel = 7
            } else if(UserData.getScore(level: 5) > 0) {
                currentLevel = 6
            } else if(UserData.getScore(level: 4) > 0) {
                currentLevel = 5
            } else if(UserData.getScore(level: 3) > 0) {
                currentLevel = 4
            } else if(UserData.getScore(level: 2) > 0) {
                currentLevel = 3
            } else if(UserData.getScore(level: 1) > 0) {
                currentLevel = 2
            }
        return currentLevel
    }
    
    override func update(_ currentTime: TimeInterval) {
        if(self.dilloDied) {
            self.dilloDied = !self.dilloDied
            self.dillo = Dillo(posX: -0.48, posY: 1.2, zPos: 1.0, name: "dillo")
            self.addChild(self.dillo!)
        }
        
        if(!self.dillo!.getAtStart()) {
            self.dillo!.physicsBody!.velocity.dx = self.dillo!.getVelocity()
        }
        self.dillo!.walkAfterRoll(gameFinished: false)
        self.dillo!.atSpring(spring: self.spring!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        if(self.okayButton != nil && self.okayButton!.contains(touchLocation) && self.okayPromptOpen) {
            self.okayButton!.touchBegin()
        }
        
        self.packMenu!.touchLevelPacksB(touchLocation: touchLocation, levelMenuOpen: self.levelMenuOpen, leaderboardOpen: self.leaderboard!.leaderboardOpen)

        // touch play button
        if(self.playButton!.contains(touchLocation) && !self.packMenu!.getLevelPacksMenuOpen() && !self.levelMenuOpen && !Locker.getButtonLock() && !self.leaderboard!.leaderboardOpen) {
            self.playButton!.touchBegin()
        }
        
        self.leaderboard?.touchLeaderboardButton(touchLocation: touchLocation, packMenuOpen: self.packMenu!.getLevelPacksMenuOpen(), levelMenuOpen: self.levelMenuOpen)
        
        self.packMenu!.touchPack1B(touchLocation: touchLocation)
        
        // touch close button
        if(self.close!.contains(touchLocation) && !self.closeButtonPressed) {
            self.closeButtonPressed = !self.closeButtonPressed
        }
        
        // touch level 1 button
        if(self.level1B!.contains(touchLocation) && self.levelMenuOpen && !Locker.getButtonLock()) {
            self.level1B!.touchBegin()
        }
        
        // touch level 2 button
        if(self.level2B!.contains(touchLocation) && self.levelMenuOpen && !Locker.getButtonLock() && UserData.getScore(level: 1) != 0) {
            self.level2B!.touchBegin()
        }
        
        // touch level 3 button
        if(self.level3B!.contains(touchLocation) && self.levelMenuOpen && !Locker.getButtonLock() && UserData.getScore(level: 2) != 0) {
            self.level3B!.touchBegin()
        }
        
        // touch level 4 button
        if(self.level4B!.contains(touchLocation) && self.levelMenuOpen && !Locker.getButtonLock() && UserData.getScore(level: 3) != 0) {
            self.level4B!.touchBegin()
        }
        
        // touch level 5 button
        if(self.level5B!.contains(touchLocation) && self.levelMenuOpen && !Locker.getButtonLock() && UserData.getScore(level: 4) != 0) {
            self.level5B!.touchBegin()
        }
        
        // touch level 6 button
        if(self.level6B!.contains(touchLocation) && self.levelMenuOpen && !Locker.getButtonLock() && UserData.getScore(level: 6) != 0) {
            self.level6B!.touchBegin()
        }
        
        // touch level 7 button
        if(self.level7B!.contains(touchLocation) && self.levelMenuOpen && !Locker.getButtonLock() && UserData.getScore(level: 6) != 0) {
            self.level7B!.touchBegin()
        }
        
        // touch level 8 button
        if(self.level8B!.contains(touchLocation) && self.levelMenuOpen && !Locker.getButtonLock() && UserData.getScore(level: 7) != 0) {
            self.level8B!.touchBegin()
        }
        
        // leaderboard scroll
        self.leaderboard!.scrollBegin(touchLocation: touchLocation)
        
        self.leaderboard!.touchCloseLeaderboard(touchLocation: touchLocation)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        self.leaderboard!.scroll(touchLocation: touchLocation)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // leaderboard scroll
        self.leaderboard!.scrollEnd()
        
        self.leaderboard!.releaseCloseLeaderboard()
        
        // bring up level pack menu
        self.packMenu!.releaseLevelPacksB(closeButton: self.close!)
        
        // bring up level menu
        if(self.packMenu!.getPack1B().getChangeBool()) {
            self.packMenu!.getPack1B().touchRelease()
            self.packMenu!.setLevelPacksMenuOpen(open: false)
            self.levelMenuOpen = !self.levelMenuOpen
            self.addChild(self.levelMenu!)
            self.addChild(self.level1B!)
            self.addChild(self.pack1Level1Saved!)
            self.addChild(self.div81!)
            self.addChild(self.level2B!)
            self.addChild(self.pack1Level2Saved!)
            self.addChild(self.div82!)
            if(UserData.getScore(level: 1) == 0) {
                self.addChild(self.level2BGrey!)
            }
            self.addChild(self.level3B!)
            self.addChild(self.pack1Level3Saved!)
            self.addChild(self.div83!)
            if(UserData.getScore(level: 2) == 0) {
                self.addChild(self.level3BGrey!)
            }
            self.addChild(self.level4B!)
            self.addChild(self.pack1Level4Saved!)
            self.addChild(self.div84!)
            if(UserData.getScore(level: 3) == 0) {
                self.addChild(self.level4BGrey!)
            }
            self.addChild(self.level5B!)
            self.addChild(self.pack1Level5Saved!)
            self.addChild(self.div85!)
            if(UserData.getScore(level: 4) == 0) {
                self.addChild(self.level5BGrey!)
            }
            self.addChild(self.level6B!)
            self.addChild(self.pack1Level6Saved!)
            self.addChild(self.div86!)
            if(UserData.getScore(level: 5) == 0) {
                self.addChild(self.level6BGrey!)
            }
            self.addChild(self.level7B!)
            self.addChild(self.div87!)
            self.addChild(self.pack1Level7Saved!)
            if(UserData.getScore(level: 6) == 0) {
                self.addChild(self.level7BGrey!)
            }
            self.addChild(self.level8B!)
            self.addChild(self.div88!)
            self.addChild(self.pack1Level8Saved!)
            if(UserData.getScore(level: 7) == 0) {
                self.addChild(self.level8BGrey!)
            }
        }
        
        // close button actions
        if(self.closeButtonPressed) {
            self.closeButtonPressed = false
            self.packMenu!.closePackmenu(closeButton: self.close!)
            
            if(self.levelMenuOpen) {
                self.levelMenu!.removeFromParent()
                self.level1B!.removeFromParent()
                self.level2B!.removeFromParent()
                self.level2BGrey!.removeFromParent()
                self.level3B!.removeFromParent()
                self.level3BGrey!.removeFromParent()
                self.level4B!.removeFromParent()
                self.level4BGrey!.removeFromParent()
                self.level5B!.removeFromParent()
                self.level5BGrey!.removeFromParent()
                self.level6B!.removeFromParent()
                self.level6BGrey!.removeFromParent()
                self.level7B!.removeFromParent()
                self.level7BGrey!.removeFromParent()
                self.level8B!.removeFromParent()
                self.level8BGrey!.removeFromParent()
                self.div81!.removeFromParent()
                self.div82!.removeFromParent()
                self.div83!.removeFromParent()
                self.div84!.removeFromParent()
                self.div85!.removeFromParent()
                self.div86!.removeFromParent()
                self.div87!.removeFromParent()
                self.div88!.removeFromParent()
                self.pack1Level1Saved!.removeFromParent()
                self.pack1Level2Saved!.removeFromParent()
                self.pack1Level3Saved!.removeFromParent()
                self.pack1Level4Saved!.removeFromParent()
                self.pack1Level5Saved!.removeFromParent()
                self.pack1Level6Saved!.removeFromParent()
                self.pack1Level7Saved!.removeFromParent()
                self.pack1Level8Saved!.removeFromParent()
                self.levelMenuOpen = false
                self.packMenu!.setLevelPacksMenuOpen(open: true)
            }
        }
        
        if(self.okayButton != nil && self.okayButton!.getChangeBool()) {
            self.okayPromptOpen = false
            self.okayPrompt!.removeFromParent()
            self.okayButton!.removeFromParent()
            self.okayButton!.touchRelease()
        }
        
        // play button
        self.playButton!.touchRelease()
        
        self.leaderboard!.openLeaderboard(scene: self)
        
        // start level 1
        self.level1B!.touchRelease()
        
        // start level 2
        self.level2B!.touchRelease()
        
        // start level 3
        self.level3B!.touchRelease()
        
        // start level 4
        self.level4B!.touchRelease()
        
        // start level 5
        self.level5B!.touchRelease()
        
        // start level 6
        self.level6B!.touchRelease()
        
        // start level 7
        self.level7B!.touchRelease()
        
        // start level 8
        self.level8B!.touchRelease()
    }
    
    /**
        physics contact
     */
    func didBegin(_ contact: SKPhysicsContact) {
        self.dillo!.rollIntoWalkAtBeginning(contact: contact, gameStarted: 2, gameFinished: false)
        if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
            self.dillo!.landOnSpring(spring: self.spring!)
        }
        if(self.dillo!.hitDeathBarrier(contact: contact, dillosDead: 0) != 0) {
            self.dilloDied = !self.dilloDied
        }
    }
}
