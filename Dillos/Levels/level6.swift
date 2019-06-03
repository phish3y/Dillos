// Dillos Level 6
import SpriteKit

class Level6: Level {
    
    var spring: Spring?
    var cannon: Cannon?
    
    var baseGround: GroundBase?
    var floatGround: GroundFloat?
    var floatGround2: GroundFloat?
    var floatGround3: GroundFloat?
    var floatGround4: GroundFloat?
    var floatGround5: GroundFloat?
    
    var box: Box?
    var chain: Chain?
    
    var death: DeathBarrier?
    
    var lever: Lever?
    var lever2: Lever?
    
    override func didMoveLevelSpecific() {
        self.currentLevel = 6
        self.nextLevel = "p1l7"
        self.nextLevelFull = "Level7"
        self.numberOfSprings = 1
        self.numberOfCannons = 1
        self.dilloPos = CGPoint(x: -0.46, y: 0.48)
        self.nestPos = CGPoint(x: -0.31, y: 0.17)
        
        self.spring = Spring(name: "spring1", zPosition: 0.250)
        self.cannon = Cannon(name: "cannon1", zPosition: 0.245)
        
        // initalize background
        self.addChild(Background(backgroundPic: "lv6_1.png"))
        
        // set up static ground
        self.baseGround = GroundBase(img: "lv6_2.png")
        self.addChild(self.baseGround!)
        
        // float grounds
        self.floatGround = GroundFloat(posX: -0.237, posY: 0.2, img: "lv6_3.png")
        self.addChild(self.floatGround!)
        
        self.floatGround2 = GroundFloat(posX: -0.336, posY: 0.442, img: "lv6_4.png")
        self.addChild(self.floatGround2!)
        
        self.floatGround3 = GroundFloat(posX: 0.188, posY: -0.1, img: "lv6_5.png")
        self.addChild(self.floatGround3!)
        
        self.floatGround4 = GroundFloat(posX: -0.22, posY: -0.1, img: "lv6_6.png")
        self.addChild(self.floatGround4!)
        
        self.floatGround5 = GroundFloat(posX: 0.449, posY: 0.027, img: "lv6_7.png")
        self.addChild(self.floatGround5!)
        
        self.box = Box(posX: -0.026, posY: -0.4)
        self.addChild(self.box!)
        
        self.chain = Chain(posX: -0.023, box: self.box!, bridge: nil)
        self.addChild(self.chain!)
        
        self.death = DeathBarrier(sizeX: 100.0, posX: -0.03, posY: -0.34)
        self.addChild(self.death!)
        
        self.lever = Lever(posX: 0.48, posY: 0.127)
        self.addChild(self.lever!)
        
        self.lever2 = Lever(posX: -0.145, posY: 0.182)
        self.addChild(self.lever2!)
    }
    
    
    override func updateLevelSpecific() {
        
        // when dillo gets to spring
        self.dillo1!.atSpring(spring: self.spring!)
        self.dillo2!.atSpring(spring: self.spring!)
        self.dillo3!.atSpring(spring: self.spring!)
        self.dillo4!.atSpring(spring: self.spring!)
        self.dillo5!.atSpring(spring: self.spring!)
        self.dillo6!.atSpring(spring: self.spring!)
        self.dillo7!.atSpring(spring: self.spring!)
        self.dillo8!.atSpring(spring: self.spring!)
        
        self.spring!.snap(scene: self, springButton: self.springButton!)
        self.spring!.snapFinal()
        
        // cannon1
        self.dillo1!.enterCannon(cannon: self.cannon!)
        self.dillo1!.fire(scene: self, cannon: self.cannon!)
        self.dillo1!.walkAfterCannon()
        self.dillo2!.enterCannon(cannon: self.cannon!)
        self.dillo2!.fire(scene: self, cannon: self.cannon!)
        self.dillo2!.walkAfterCannon()
        self.dillo3!.enterCannon(cannon: self.cannon!)
        self.dillo3!.fire(scene: self, cannon: self.cannon!)
        self.dillo3!.walkAfterCannon()
        self.dillo4!.enterCannon(cannon: self.cannon!)
        self.dillo4!.fire(scene: self, cannon: self.cannon!)
        self.dillo4!.walkAfterCannon()
        self.dillo5!.enterCannon(cannon: self.cannon!)
        self.dillo5!.fire(scene: self, cannon: self.cannon!)
        self.dillo5!.walkAfterCannon()
        self.dillo6!.enterCannon(cannon: self.cannon!)
        self.dillo6!.fire(scene: self, cannon: self.cannon!)
        self.dillo6!.walkAfterCannon()
        self.dillo7!.enterCannon(cannon: self.cannon!)
        self.dillo7!.fire(scene: self, cannon: self.cannon!)
        self.dillo7!.walkAfterCannon()
        self.dillo8!.enterCannon(cannon: self.cannon!)
        self.dillo8!.fire(scene: self, cannon: self.cannon!)
        self.dillo8!.walkAfterCannon()
        
        self.cannon!.snap(scene: self, cannonButton: self.cannonButton!)
        self.cannon!.snapFinal()
        
        // lever
        self.dillo1!.atLever(lever: self.lever!)
        self.dillo2!.atLever(lever: self.lever!)
        self.dillo3!.atLever(lever: self.lever!)
        self.dillo4!.atLever(lever: self.lever!)
        self.dillo5!.atLever(lever: self.lever!)
        self.dillo6!.atLever(lever: self.lever!)
        self.dillo7!.atLever(lever: self.lever!)
        self.dillo8!.atLever(lever: self.lever!)
        
        self.dillo1!.leaveLever(scene: self, lever: self.lever!)
        self.dillo2!.leaveLever(scene: self, lever: self.lever!)
        self.dillo3!.leaveLever(scene: self, lever: self.lever!)
        self.dillo4!.leaveLever(scene: self, lever: self.lever!)
        self.dillo5!.leaveLever(scene: self, lever: self.lever!)
        self.dillo6!.leaveLever(scene: self, lever: self.lever!)
        self.dillo7!.leaveLever(scene: self, lever: self.lever!)
        self.dillo8!.leaveLever(scene: self, lever: self.lever!)
        
        self.dillo1!.atLever(lever: self.lever2!)
        self.dillo2!.atLever(lever: self.lever2!)
        self.dillo3!.atLever(lever: self.lever2!)
        self.dillo4!.atLever(lever: self.lever2!)
        self.dillo5!.atLever(lever: self.lever2!)
        self.dillo6!.atLever(lever: self.lever2!)
        self.dillo7!.atLever(lever: self.lever2!)
        self.dillo8!.atLever(lever: self.lever2!)
        
        self.dillo1!.leaveLever(scene: self, lever: self.lever2!)
        self.dillo2!.leaveLever(scene: self, lever: self.lever2!)
        self.dillo3!.leaveLever(scene: self, lever: self.lever2!)
        self.dillo4!.leaveLever(scene: self, lever: self.lever2!)
        self.dillo5!.leaveLever(scene: self, lever: self.lever2!)
        self.dillo6!.leaveLever(scene: self, lever: self.lever2!)
        self.dillo7!.leaveLever(scene: self, lever: self.lever2!)
        self.dillo8!.leaveLever(scene: self, lever: self.lever2!)
        
        self.dillo1!.stopForLever()
        self.dillo2!.stopForLever()
        self.dillo3!.stopForLever()
        self.dillo4!.stopForLever()
        self.dillo5!.stopForLever()
        self.dillo6!.stopForLever()
        self.dillo7!.stopForLever()
        self.dillo8!.stopForLever()
        
        self.dillo1!.startAfterLever()
        self.dillo2!.startAfterLever()
        self.dillo3!.startAfterLever()
        self.dillo4!.startAfterLever()
        self.dillo5!.startAfterLever()
        self.dillo6!.startAfterLever()
        self.dillo7!.startAfterLever()
        self.dillo8!.startAfterLever()
        
        // box
        self.box!.startMove(up: true, lever: self.lever!, chain: self.chain!)
        self.box!.continueMove(up: true)
        self.box!.stopMove(posY: 0.32, lever: self.lever!)
        self.chain!.position = CGPoint(x: Screen.screen!.width * self.chain!.posX!, y: (self.box!.frame.maxY - 5) + (self.chain!.frame.height / 2.0))
        
        self.box!.startMove(up: false, lever: self.lever2!, chain: self.chain!)
        self.box!.continueMove(up: false)
        self.box!.stopMove(posY: 0.15                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   , lever: self.lever2!)
        
        self.spring!.moveWithBox()
        self.spring!.cleanUpMoveWithBox()
        self.cannon!.moveWithBox()
        self.cannon!.cleanUpMoveWithBox()
        // so the box can't send one of these skating around
        if(self.cannon!.physicsBody!.velocity.dx > 1.0) {
            self.cannon!.physicsBody!.velocity.dx = 0.0
        }
        if(self.spring!.physicsBody!.velocity.dx > 1.0) {
            self.spring!.physicsBody!.velocity.dx = 0.0
        }
    }
    
    
    override func touchesBeganLevelSpecific(touchLocation: CGPoint, touchCount: Int) {
        // spring button
        if(self.springButton!.contains(touchLocation) && !self.gameFinished! && self.gameStarted != 0 && !Locker.getButtonLock()) {
            if(!self.spring!.getSpawned() && self.springButton!.getNumberOfSprings() > 0) {
                self.spring!.changeSpringInUse()
                self.spring!.changeSpawned()
                self.spring!.position = CGPoint(x: touchLocation.x, y: touchLocation.y)
                self.addChild(self.spring!)
            }
            self.springButton!.touchBegin()
        }
        
        // cannon button
        if(self.cannonButton!.contains(touchLocation) && !self.gameFinished! && self.gameStarted != 0 && !Locker.getButtonLock()) {
            if(!self.cannon!.getSpawned() && self.cannonButton!.getNumberOfCannons() > 0) {
                self.cannon!.changeCannonInUse()
                self.cannon!.changeSpawned()
                self.cannon!.position = CGPoint(x: touchLocation.x, y: touchLocation.y)
                self.addChild(self.cannon!)
            }
            self.cannonButton!.touchBegin()
        }
        
        self.spring!.relocate(touchLocation: touchLocation, gameFinished: self.gameFinished!)
        self.cannon!.relocate(touchLocation: touchLocation, gameFinished: self.gameFinished!)
        self.cannon!.changeDirection(touchLocation: touchLocation, numberOfTouches: touchCount, gameFinished: self.gameFinished!)
    }
    
    
    override func touchesMovedLevelSpecific(touchLocation: CGPoint) {
        // drag spring
        self.spring!.drag(touchLocation: touchLocation)
        self.cannon!.drag(touchLocation: touchLocation)
    }
    
    
    override func touchesEndedLevelSpecific(touchLocation: CGPoint) {
        // spring snap
        if(self.spring!.getSpringInUse()) {
            Locker.changeItemLock()
            self.spring!.changeSpringInUse()
            if(touchLocation.y < self.frame.height * -0.35) {
                // spring dropped below base ground, return it to toolbar
                self.spring!.removeFromParent()
                self.spring!.changeSpawned()
                self.spring!.position = CGPoint(x: Screen.screen!.minX - 100, y: 0)
                self.springButton!.returnSpringToToolbar()
            } else {
                self.spring!.setSnapping(snapping: true)
                self.spring!.physicsBody!.isDynamic = true
            }
        }
        
        /*cannon snap*/
        if(self.cannon!.getCannonInUse()) {
            Locker.changeItemLock()
            self.cannon!.changeCannonInUse()
            if(touchLocation.y < self.frame.height * -0.35) {
                // cannon dropped below base ground, return it to toolbar
                self.cannon!.removeFromParent()
                self.cannon!.changeSpawned()
                self.cannon!.position = CGPoint(x: Screen.screen!.minX - 100, y: 0)
                self.cannonButton!.returnCannonToToolbar()
            } else {
                self.cannon!.setSnapping(snapping: true)
                self.cannon!.physicsBody!.isDynamic = true
            }
        }
        
        // activate lever
        self.lever!.pullLever(touchLocation: touchLocation)
        self.lever2!.pullLever(touchLocation: touchLocation)
    }
    
    
    override func didBeginLevelSpecific(contact: SKPhysicsContact) {
        
        self.spring!.stopSnap(contact: contact)
        self.cannon!.stopSnap(contact: contact)
        
        // land on spring
        // hit ground after sprung
        // hit ground after cannon
        // hit death barrier
        if(contact.bodyA.node?.name == "dillo1" || contact.bodyB.node?.name == "dillo1") {
            self.dillo1!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo1!.landOnSpring(spring: self.spring!)
            }
            self.dillo1!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo1!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo2" || contact.bodyB.node?.name == "dillo2") {
            self.dillo2!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo2!.landOnSpring(spring: self.spring!)
            }
            self.dillo2!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo2!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo3" || contact.bodyB.node?.name == "dillo3") {
            self.dillo3!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo3!.landOnSpring(spring: self.spring!)
            }
            self.dillo3!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo3!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo4" || contact.bodyB.node?.name == "dillo4") {
            self.dillo4!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo4!.landOnSpring(spring: self.spring!)
            }
            self.dillo4!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo4!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo5" || contact.bodyB.node?.name == "dillo5") {
            self.dillo5!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo5!.landOnSpring(spring: self.spring!)
            }
            self.dillo5!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo5!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo6" || contact.bodyB.node?.name == "dillo6") {
            self.dillo6!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo6!.landOnSpring(spring: self.spring!)
            }
            self.dillo6!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo6!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo7" || contact.bodyB.node?.name == "dillo7") {
            self.dillo7!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo7!.landOnSpring(spring: self.spring!)
            }
            self.dillo7!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo7!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo8" || contact.bodyB.node?.name == "dillo8") {
            self.dillo8!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo8!.landOnSpring(spring: self.spring!)
            }
            self.dillo8!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo8!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }
    }
}

