import SpriteKit
//import GoogleMobileAds

class Level: SKScene, SKPhysicsContactDelegate {
    
    // dillos
    // initialized in level specifc setup
    var dillo1: Dillo?
    var dillo2: Dillo?
    var dillo3: Dillo?
    var dillo4: Dillo?
    var dillo5: Dillo?
    var dillo6: Dillo?
    var dillo7: Dillo?
    var dillo8: Dillo?
    
    var nest: Nest?
    
    // text at start of game
    var startText: SKLabelNode?
    var startTextBottom: SKLabelNode?
    
    // screen that pops up when level attempt is over and its buttons
    var levelFinish: LevelFinish?
    var retryButton: RetryButton?
    var nextButton: NextButton?
    var nextButtonGrey: NextButtonGrey?
    var menuButtonLevelFinish: MenuButtonLevelFinish?
    
    // y/n prompt screen and buttons
    var ynPrompt: YNPrompt?
    var noButton: NoButton?
    var yesButton: YesButton?
    
    var willYesFinish: Bool?
    var willYesGoToMenu: Bool?
    var willYesRestart: Bool?
    
    var finishPromptText: SKLabelNode?
    var restartPromptText: SKLabelNode?
    var menuPromptText: SKLabelNode?
    
    // buttons on toolbar
    var restartButton: RestartButton?
    var menuButtonToolbar: MenuButtonToolbar?
    var finishButton: FinishButton?
    var springButton: SpringButton?
    var cannonButton: CannonButton?
    
    var gameStarted: Int?
    var gameFinished: Bool?
    var dillosFinished: Int?
    var dillosDead: Int?
    
    // these will be set in each respective level
    // by overriding 'levelSpecificSetup'
    var currentLevel: Int?
    var nextLevel: String?
    var nextLevelFull: String?
    var numberOfSprings: Int?
    var numberOfCannons: Int?
    var dilloPos: CGPoint?
    var nestPos: CGPoint?
    
    var time: CFTimeInterval?
    
    // overridden in each level for one off setup
    func didMoveLevelSpecific(){}

    override func didMove(to view: SKView) {
        
        GameViewController.pullNewAd()
        
        Locker.resetButtonLock()
        Locker.resetItemLock()
        Locker.resetPromptLock()
        
        self.didMoveLevelSpecific()
        
        self.dillo1 = Dillo(posX: self.dilloPos!.x, posY: self.dilloPos!.y, zPos: 1.3, name: "dillo1")
        self.dillo2 = Dillo(posX: self.dilloPos!.x, posY: self.dilloPos!.y, zPos: 1.2, name: "dillo2")
        self.dillo3 = Dillo(posX: self.dilloPos!.x, posY: self.dilloPos!.y, zPos: 1.1, name: "dillo3")
        self.dillo4 = Dillo(posX: self.dilloPos!.x, posY: self.dilloPos!.y, zPos: 1.0, name: "dillo4")
        self.dillo5 = Dillo(posX: self.dilloPos!.x, posY: self.dilloPos!.y, zPos: 0.9, name: "dillo5")
        self.dillo6 = Dillo(posX: self.dilloPos!.x, posY: self.dilloPos!.y, zPos: 0.8, name: "dillo6")
        self.dillo7 = Dillo(posX: self.dilloPos!.x, posY: self.dilloPos!.y, zPos: 0.7, name: "dillo7")
        self.dillo8 = Dillo(posX: self.dilloPos!.x, posY: self.dilloPos!.y, zPos: 0.6, name: "dillo8")
        
        self.nest = Nest(posX: self.nestPos!.x, posY: self.nestPos!.y)
        self.addChild(self.nest!)
        
        // text at start of game
        self.startText = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        self.startText!.text = "Double Tap to Start"
        self.startText!.fontSize = Screen.screen!.width * 0.1
        self.startText!.color = SKColor.white
        self.startText!.zPosition = 2.3
        self.startText!.position = CGPoint(x: Screen.screen!.width * 0.0, y: Screen.screen!.height * 0.15)
        self.addChild(self.startText!)
        
        self.startTextBottom = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        self.startTextBottom!.text = "Get the Dillos Safely to their Nest"
        self.startTextBottom!.fontSize = Screen.screen!.width * 0.05
        self.startTextBottom!.color = SKColor.white
        self.startTextBottom!.zPosition = 2.3
        self.startTextBottom!.position = CGPoint(x: Screen.screen!.width * 0.0, y: Screen.screen!.height * 0.02)
        self.addChild(self.startTextBottom!)
    
        // level finish 
        self.levelFinish = LevelFinish()
        self.retryButton = RetryButton()
        self.nextButton = NextButton()
        self.nextButtonGrey = NextButtonGrey()
        self.menuButtonLevelFinish = MenuButtonLevelFinish()
        
        // y/n prompt
        self.ynPrompt = YNPrompt()
        self.noButton = NoButton()
        self.yesButton = YesButton()
        
        self.willYesFinish = false
        self.willYesGoToMenu = false
        self.willYesRestart = false
        
        self.finishPromptText = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        self.finishPromptText!.text = "Finish?"
        self.finishPromptText!.position = CGPoint(x: Screen.screen!.width * 0, y: Screen.screen!.height * 0.05)
        self.finishPromptText!.fontSize = CGFloat(Screen.screen!.width * 0.05)
        self.finishPromptText!.fontColor = SKColor.black
        self.finishPromptText!.zPosition = 2.1
        
        self.restartPromptText = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        self.restartPromptText!.text = "Restart?"
        self.restartPromptText!.position = CGPoint(x: Screen.screen!.width * 0, y: Screen.screen!.height * 0.05)
        self.restartPromptText!.fontSize = CGFloat(Screen.screen!.width * 0.05)
        self.restartPromptText!.fontColor = SKColor.black
        self.restartPromptText!.zPosition = 2.1
        
        self.menuPromptText = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        self.menuPromptText!.text = "Go to Menu?"
        self.menuPromptText!.position = CGPoint(x: Screen.screen!.width * 0, y: Screen.screen!.height * 0.05)
        self.menuPromptText!.fontSize = CGFloat(Screen.screen!.width * 0.035)
        self.menuPromptText!.fontColor = SKColor.black
        self.menuPromptText!.zPosition = 2.1
        
        // buttons on toolbar
        self.restartButton = RestartButton()
        self.addChild(self.restartButton!)
        self.menuButtonToolbar = MenuButtonToolbar()
        self.addChild(self.menuButtonToolbar!)
        self.finishButton = FinishButton()
        self.addChild(self.finishButton!)
        self.springButton = SpringButton(numberOfSprings: self.numberOfSprings!)
        self.addChild(self.springButton!)
        self.cannonButton = CannonButton(numberOfCannons: self.numberOfCannons!)
        self.addChild(self.cannonButton!)
        
        self.gameStarted = 0
        self.gameFinished = false
        self.dillosFinished = 0
        self.dillosDead = 0
        
        // add toolbar background
        self.addChild(Toolbar())

        // physics setup
        self.physicsWorld.gravity.dy = -5.0
        self.physicsWorld.contactDelegate = self
        
        self.initOutsideFrame()
    }
    
    
    // overridden in each level for one off update
    func updateLevelSpecific(){}
    
    override func update(_ currentTime: TimeInterval) {
    
        self.updateLevelSpecific()
        
        // game started
        if(self.gameStarted == 1) {
            self.startText!.removeFromParent()
            self.startTextBottom!.removeFromParent()
            self.time = round(currentTime)
            self.gameStarted! += 1
        }
        
        // game finished
        if(!self.gameFinished! && (self.dillosFinished! + self.dillosDead!) == 8) {
            self.levelOverUpdate()
        }
        
        // spawn dillos
        if(self.gameStarted == 2 && !self.gameFinished! && round(currentTime) > self.time! + 3.0 && Dillo.dilloSpawnIndex < 8) {
            if(Dillo.dilloSpawnIndex == 1) {
                self.addChild(self.dillo2!)
            }else if(Dillo.dilloSpawnIndex == 2) {
                self.addChild(self.dillo3!)
            }else if(Dillo.dilloSpawnIndex == 3) {
                self.addChild(self.dillo4!)
            }else if(Dillo.dilloSpawnIndex == 4) {
                self.addChild(self.dillo5!)
            }else if(Dillo.dilloSpawnIndex == 5) {
                self.addChild(self.dillo6!)
            }else if(Dillo.dilloSpawnIndex == 6) {
                self.addChild(self.dillo7!)
            }else if(Dillo.dilloSpawnIndex == 7) {
                self.addChild(self.dillo8!)
            }
            self.time! += 3.0
            Dillo.dilloSpawnIndex += 1
        }
        
        // dillo hit wall
        self.dillo1!.hitWall(gameFinished: self.gameFinished!)
        self.dillo2!.hitWall(gameFinished: self.gameFinished!)
        self.dillo3!.hitWall(gameFinished: self.gameFinished!)
        self.dillo4!.hitWall(gameFinished: self.gameFinished!)
        self.dillo5!.hitWall(gameFinished: self.gameFinished!)
        self.dillo6!.hitWall(gameFinished: self.gameFinished!)
        self.dillo7!.hitWall(gameFinished: self.gameFinished!)
        self.dillo8!.hitWall(gameFinished: self.gameFinished!)
        
        // dillo can't move until it hits ground at start
        if(!self.dillo1!.getAtStart() && !self.gameFinished!) {
            self.dillo1!.physicsBody!.velocity.dx = self.dillo1!.getVelocity()
        }
        if(!self.dillo2!.getAtStart() && !self.gameFinished!) {
            self.dillo2!.physicsBody!.velocity.dx = self.dillo2!.getVelocity()
        }
        if(!self.dillo3!.getAtStart() && !self.gameFinished!) {
            self.dillo3!.physicsBody!.velocity.dx = self.dillo3!.getVelocity()
        }
        if(!self.dillo4!.getAtStart() && !self.gameFinished!) {
            self.dillo4!.physicsBody!.velocity.dx = self.dillo4!.getVelocity()
        }
        if(!self.dillo5!.getAtStart() && !self.gameFinished!) {
            self.dillo5!.physicsBody!.velocity.dx = self.dillo5!.getVelocity()
        }
        if(!self.dillo6!.getAtStart() && !self.gameFinished!) {
            self.dillo6!.physicsBody!.velocity.dx = self.dillo6!.getVelocity()
        }
        if(!self.dillo7!.getAtStart() && !self.gameFinished!) {
            self.dillo7!.physicsBody!.velocity.dx = self.dillo7!.getVelocity()
        }
        if(!self.dillo8!.getAtStart() && !self.gameFinished!) {
            self.dillo8!.physicsBody!.velocity.dx = self.dillo8!.getVelocity()
        }
        
        // start walk animation after roll is complete
        self.dillo1!.walkAfterRoll(gameFinished: self.gameFinished!)
        self.dillo2!.walkAfterRoll(gameFinished: self.gameFinished!)
        self.dillo3!.walkAfterRoll(gameFinished: self.gameFinished!)
        self.dillo4!.walkAfterRoll(gameFinished: self.gameFinished!)
        self.dillo5!.walkAfterRoll(gameFinished: self.gameFinished!)
        self.dillo6!.walkAfterRoll(gameFinished: self.gameFinished!)
        self.dillo7!.walkAfterRoll(gameFinished: self.gameFinished!)
        self.dillo8!.walkAfterRoll(gameFinished: self.gameFinished!)
        
        // dillo at nest
        self.dillosFinished = self.dillo1!.atNest(nest: self.nest!, dillosFinished: self.dillosFinished!)
        self.dillosFinished = self.dillo2!.atNest(nest: self.nest!, dillosFinished: self.dillosFinished!)
        self.dillosFinished = self.dillo3!.atNest(nest: self.nest!, dillosFinished: self.dillosFinished!)
        self.dillosFinished = self.dillo4!.atNest(nest: self.nest!, dillosFinished: self.dillosFinished!)
        self.dillosFinished = self.dillo5!.atNest(nest: self.nest!, dillosFinished: self.dillosFinished!)
        self.dillosFinished = self.dillo6!.atNest(nest: self.nest!, dillosFinished: self.dillosFinished!)
        self.dillosFinished = self.dillo7!.atNest(nest: self.nest!, dillosFinished: self.dillosFinished!)
        self.dillosFinished = self.dillo8!.atNest(nest: self.nest!, dillosFinished: self.dillosFinished!)

    }
    

    // overridden in each level for one off touches began
    func touchesBeganLevelSpecific(touchLocation: CGPoint, touchCount: Int){}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        self.touchesBeganLevelSpecific(touchLocation: touchLocation, touchCount: touch.tapCount)
        
        // start game
        if(self.gameStarted == 0 && touch.tapCount == 2) {
            self.addChild(self.dillo1!)
            self.gameStarted! += 1
        }
        
        // menu button on level finish screen touched
        if(self.menuButtonLevelFinish!.contains(touchLocation)
            && self.gameStarted! > 1
            && self.gameFinished!
            && !Locker.getButtonLock()) {
            self.menuButtonLevelFinish!.touchBegin()
        }
        
        // next button on level finish screen
        if(self.nextButton!.contains(touchLocation) && self.gameFinished! && (self.dillosFinished! > 0  || UserData.getScore(level: self.currentLevel!) > 0) && !Locker.getButtonLock()) {
            self.nextButton!.touchBegin()
        }
        
        // retry button on level finish
        if(self.retryButton!.contains(touchLocation) && self.gameFinished! && !Locker.getButtonLock()) {
            self.retryButton!.touchBegin()
        }
        
        // restart button on toolbar
        if(self.restartButton!.contains(touchLocation)
            && !self.gameFinished!
            && self.gameStarted! > 1
            && !Locker.getButtonLock()
            && !Locker.getPromptLock()) {
            self.willYesRestart = !self.willYesRestart!
            self.restartButton!.touchBegin()
        }
        
        // finish button on toolbar
        if(self.finishButton!.contains(touchLocation) && self.gameStarted! > 1 && !self.gameFinished! && !Locker.getButtonLock() && !Locker.getPromptLock()) {
            self.finishButton!.touchBegin()
        }
        
        // menu button on toolbar
        if(self.menuButtonToolbar!.contains(touchLocation) && self.gameStarted! > 1 && !self.gameFinished! && !Locker.getButtonLock() && !Locker.getPromptLock()) {
            self.menuButtonToolbar!.touchBegin()
        }
        
        // no button
        if(self.noButton!.contains(touchLocation) && (self.restartButton!.getChangeInt() > 0 || self.menuButtonToolbar!.getChangeInt() > 0 || self.finishButton!.getChangeInt() > 0) && !Locker.getButtonLock()) {
            self.noButton!.touchBegin()
        }
        
        // yes button
        if(self.yesButton!.contains(touchLocation) && !Locker.getButtonLock() && (self.restartButton!.getChangeInt() > 0 || self.menuButtonToolbar!.getChangeInt() > 0 || self.finishButton!.getChangeInt() > 0)){
            self.yesButton!.touchBegin()
        }
    }
    
    func touchesMovedLevelSpecific(touchLocation: CGPoint) {}
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        self.touchesMovedLevelSpecific(touchLocation: touchLocation)
    }
    
    
    // overridden in each level for one off touch ended
    func touchesEndedLevelSpecific(touchLocation: CGPoint) {}
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        self.touchesEndedLevelSpecific(touchLocation: touchLocation)
        
        // user chose to end level with finish button
        if(self.yesButton!.getChangeInt() == 1 && self.willYesFinish!) {
            self.levelOverButton()
        }
        
        // go to menu from either menu button
        if((self.yesButton!.getChangeInt() == 1 && self.willYesGoToMenu!)
            || self.menuButtonLevelFinish!.getChangeInt() == 1) {
            self.gameFinished! = true
            Locker.changeButtonLock()
            GameViewController.adBanner!.removeFromSuperview()
            self.transitionScene(scene: "Menu")
        }
        
        // no button .. remove prompt
        if(self.noButton!.getChangeInt() == 1) {
            Locker.changeButtonLock()
            Locker.changePromptLock()
            
            self.willYesGoToMenu = false
            self.willYesRestart = false
            self.willYesFinish = false
            
            self.restartPromptText!.removeFromParent()
            self.menuPromptText!.removeFromParent()
            self.finishPromptText!.removeFromParent()
            self.yesButton!.removeFromParent()
            self.ynPrompt!.removeFromParent()
            self.noButton!.removeFromParent()
            
            self.restartButton!.resetChangeInt()
            self.menuButtonToolbar!.resetChangeInt()
            self.finishButton!.resetChangeInt()
            self.noButton!.resetChangeInt()
            
            Animation.noRestartNoButton(noButton: self.noButton!)
        }
        
        // spring button
        self.springButton!.touchRelease()
        self.cannonButton!.touchRelease()
        
        // retry button on level finish screen
        if(self.retryButton!.getChangeInt() == 1) {
            self.removeAllActions()
            self.removeAllChildren()
            Dillo.dilloSpawnIndex = 0
            GameViewController.adBanner!.removeFromSuperview()
            self.didMove(to: self.view!)
        }
        
        // next button pressed on level finish screen
        if(self.nextButton!.getChangeInt() == 1) {
            Locker.changeButtonLock()
            GameViewController.adBanner!.removeFromSuperview()
            // transition to menu
            self.transitionScene(scene: self.nextLevelFull!)
        }
        
        // menu button was pressed .. bring up prompt
        if(self.menuButtonToolbar!.getChangeInt() == 1) {
            self.menuButtonToolbar!.touchRelease()
            self.addChild(self.ynPrompt!)
            self.addChild(self.yesButton!)
            self.addChild(self.noButton!)
            self.addChild(self.menuPromptText!)
            self.willYesGoToMenu = !self.willYesGoToMenu!
        }
        
        // finish button was pressed .. bring up prompt
        if(self.finishButton!.getChangeInt() == 1) {
            self.finishButton!.touchRelease()
            self.addChild(self.ynPrompt!)
            self.addChild(self.yesButton!)
            self.addChild(self.noButton!)
            self.addChild(self.finishPromptText!)
            self.willYesFinish = !self.willYesFinish!
        }
        
        // restart button pressed ... bring up prompt
        if(self.restartButton!.getChangeInt() == 1) {
            self.restartButton!.touchRelease()
            self.addChild(self.ynPrompt!)
            self.addChild(self.noButton!)
            self.addChild(self.yesButton!)
            self.addChild(self.restartPromptText!)
        }
        
        // restart level
        if(self.yesButton!.getChangeInt() == 1 && self.willYesRestart!) {
            self.removeAllActions()
            self.removeAllChildren()
            Dillo.dilloSpawnIndex = 0
            self.didMove(to: self.view!)
        }
    }
    
    
    // overridden in each level for one off touch ended
    func didBeginLevelSpecific(contact: SKPhysicsContact) {}
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        self.didBeginLevelSpecific(contact: contact)
        
        // roll into walk at beginning
        if(contact.bodyA.node?.name == "dillo1" || contact.bodyB.node?.name == "dillo1") {
            self.dillo1!.rollIntoWalkAtBeginning(contact: contact, gameStarted: self.gameStarted!, gameFinished: self.gameFinished!)
        } else if(contact.bodyA.node?.name == "dillo2" || contact.bodyB.node?.name == "dillo2") {
            self.dillo2!.rollIntoWalkAtBeginning(contact: contact, gameStarted: self.gameStarted!, gameFinished: self.gameFinished!)
        } else if(contact.bodyA.node?.name == "dillo3" || contact.bodyB.node?.name == "dillo3") {
            self.dillo3!.rollIntoWalkAtBeginning(contact: contact, gameStarted: self.gameStarted!, gameFinished: self.gameFinished!)
        } else if(contact.bodyA.node?.name == "dillo4" || contact.bodyB.node?.name == "dillo4") {
            self.dillo4!.rollIntoWalkAtBeginning(contact: contact, gameStarted: self.gameStarted!, gameFinished: self.gameFinished!)
        } else if(contact.bodyA.node?.name == "dillo5" || contact.bodyB.node?.name == "dillo5") {
            self.dillo5!.rollIntoWalkAtBeginning(contact: contact, gameStarted: self.gameStarted!, gameFinished: self.gameFinished!)
        } else if(contact.bodyA.node?.name == "dillo6" || contact.bodyB.node?.name == "dillo6") {
            self.dillo6!.rollIntoWalkAtBeginning(contact: contact, gameStarted: self.gameStarted!, gameFinished: self.gameFinished!)
        } else if(contact.bodyA.node?.name == "dillo7" || contact.bodyB.node?.name == "dillo7") {
            self.dillo7!.rollIntoWalkAtBeginning(contact: contact, gameStarted: self.gameStarted!, gameFinished: self.gameFinished!)
        } else if(contact.bodyA.node?.name == "dillo8" || contact.bodyB.node?.name == "dillo8") {
            self.dillo8!.rollIntoWalkAtBeginning(contact: contact, gameStarted: self.gameStarted!, gameFinished: self.gameFinished!)
        }
    }
    
    
    // overridden in each level for one off touch ended
    func didEndLevelSpecific(contact: SKPhysicsContact) {}
    
    func didEnd(_ contact: SKPhysicsContact) {}
    
    
    fileprivate func levelOverUpdate() {
        self.levelOverShared()
    }

    fileprivate func levelOverButton() {
        
        Locker.changeButtonLock()
        self.gameStarted! += 2
        self.willYesFinish = !self.willYesFinish!
        
        // freeze dillos
        self.dillo1!.removeAllActions()
        self.dillo2!.removeAllActions()
        self.dillo3!.removeAllActions()
        self.dillo4!.removeAllActions()
        self.dillo5!.removeAllActions()
        self.dillo6!.removeAllActions()
        self.dillo7!.removeAllActions()
        self.dillo8!.removeAllActions()
        self.dillo1!.physicsBody!.affectedByGravity = false
        self.dillo2!.physicsBody!.affectedByGravity = false
        self.dillo3!.physicsBody!.affectedByGravity = false
        self.dillo4!.physicsBody!.affectedByGravity = false
        self.dillo5!.physicsBody!.affectedByGravity = false
        self.dillo6!.physicsBody!.affectedByGravity = false
        self.dillo7!.physicsBody!.affectedByGravity = false
        self.dillo8!.physicsBody!.affectedByGravity = false
        self.dillo1!.physicsBody!.velocity = CGVector(dx: 0.0, dy: 0.0)
        self.dillo2!.physicsBody!.velocity = CGVector(dx: 0.0, dy: 0.0)
        self.dillo3!.physicsBody!.velocity = CGVector(dx: 0.0, dy: 0.0)
        self.dillo4!.physicsBody!.velocity = CGVector(dx: 0.0, dy: 0.0)
        self.dillo5!.physicsBody!.velocity = CGVector(dx: 0.0, dy: 0.0)
        self.dillo6!.physicsBody!.velocity = CGVector(dx: 0.0, dy: 0.0)
        self.dillo7!.physicsBody!.velocity = CGVector(dx: 0.0, dy: 0.0)
        self.dillo8!.physicsBody!.velocity = CGVector(dx: 0.0, dy: 0.0)
        
        self.finishPromptText!.removeFromParent()
        
        self.levelOverShared()
        
    }
    
    fileprivate func levelOverShared() {
        self.gameFinished! = true
        
        // inserts ad banner
        self.view!.addSubview(GameViewController.adBanner!)
            
        // reset the y/n prompt in case it was up from the finish button
        self.ynPrompt!.removeFromParent()
        self.noButton!.removeFromParent()
        self.yesButton!.removeFromParent()
            
        // add screen and all of buttons
        self.addChild(self.levelFinish!)
        self.addChild(self.retryButton!)
        self.addChild(self.nextButton!)
        if(self.dillosFinished! < 1 && UserData.getScore(level: self.currentLevel!) < 1) {
            self.addChild(self.nextButtonGrey!)
        }
        self.addChild(self.menuButtonLevelFinish!)
            
        // number for amount of dillos saved
        let num = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        num.position = CGPoint(x: Screen.screen!.width * -0.013, y: Screen.screen!.height * -0.122)
        num.fontSize = CGFloat(Screen.screen!.width * 0.049)
        num.fontColor = SKColor.white
        num.zPosition = 2.3
        num.text = "0"
        if(self.dillosFinished == 1) {
            num.text = "1"
        } else if(self.dillosFinished == 2) {
            num.text = "2"
        } else if(self.dillosFinished == 3) {
            num.text = "3"
        } else if(self.dillosFinished == 4) {
            num.text = "4"
        } else if(self.dillosFinished == 5) {
            num.text = "5"
        } else if(self.dillosFinished == 6) {
            num.text = "6"
        } else if(self.dillosFinished == 7) {
            num.text = "7"
        } else if(self.dillosFinished == 8) {
            num.text = "8"
        }
        self.addChild(num)
    
        // update user data
        if(self.dillosFinished! > UserData.getScore(level: self.currentLevel!)) {
            UserData.updateScore(level: self.currentLevel!, score: self.dillosFinished!)
            UserData.saveData()
        }
    }
    
    fileprivate func transitionScene(scene: String) {
        let transition = SKTransition.reveal(with: .down, duration: 2.0)
        let SceneClass = NSClassFromString("Dillos.\(scene)") as? SKScene.Type
        var sceneLower = scene
        if("Menu" != scene) {
            sceneLower = sceneLower.lowercased()
        }
        let nextScene = SceneClass!.init(fileNamed: sceneLower)
        nextScene!.scaleMode = .resizeFill
        
        let skView = self.view! as SKView
        skView.showsPhysics = false
        skView.ignoresSiblingOrder = true
        
        skView.presentScene(nextScene!, transition: transition)
    }
    
    fileprivate func initOutsideFrame() {
        let leftOutsideFrame = SKShapeNode(rectOf: CGSize(width: 1, height: self.frame.height))
        leftOutsideFrame.position = CGPoint(x: self.frame.minX, y: self.frame.midY)
        leftOutsideFrame.zPosition = -0.08
        leftOutsideFrame.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1, height: self.frame.height))
        leftOutsideFrame.physicsBody!.usesPreciseCollisionDetection = false
        leftOutsideFrame.physicsBody!.affectedByGravity = false
        leftOutsideFrame.physicsBody!.isDynamic = false
        leftOutsideFrame.physicsBody!.friction = 0.0
        self.addChild(leftOutsideFrame)
        
        let rightOutsideFrame = SKShapeNode(rectOf: CGSize(width: 1, height: self.frame.height))
        rightOutsideFrame.position = CGPoint(x: self.frame.maxX, y: self.frame.midY)
        rightOutsideFrame.zPosition = -0.08
        rightOutsideFrame.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1, height: self.frame.height))
        rightOutsideFrame.physicsBody!.usesPreciseCollisionDetection = false
        rightOutsideFrame.physicsBody!.affectedByGravity = false
        rightOutsideFrame.physicsBody!.isDynamic = false
        rightOutsideFrame.physicsBody!.friction = 0.0
        self.addChild(rightOutsideFrame)
        
        let topFrame = SKShapeNode(rectOf: CGSize(width: Screen.screen!.width, height: 1))
        topFrame.position = CGPoint(x: self.frame.midX, y: self.frame.maxY)
        topFrame.zPosition = -0.08
        topFrame.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: Screen.screen!.width, height: 1))
        topFrame.physicsBody!.affectedByGravity = false
        topFrame.physicsBody!.isDynamic = false
        topFrame.physicsBody!.friction = 0.0
        self.addChild(topFrame)
    }
}
