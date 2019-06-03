// Dillos Level 8
import SpriteKit

class Level8: Level {
    
    var spring: Spring?
    var spring2: Spring?
    var cannon: Cannon?
    
    var baseGround: GroundBase?
    var floatGround: GroundFloat?
    var floatGround2: GroundFloat?
    
    var box: Box?
    var box2: Box?
    var box3: Box?
    var chain3: Chain?
    var chain2: Chain?
    var chain: Chain?
    
    var death: DeathBarrier?
    
    var lever: Lever?
    var lever2: Lever?
    var lever3: Lever?
    var lever4: Lever?
    

    override func didMoveLevelSpecific() {
        self.currentLevel = 8
        self.nextLevel = "p1l9"
        self.nextLevelFull = "Level9"
        self.numberOfSprings = 2
        self.numberOfCannons = 1
        self.dilloPos = CGPoint(x: -0.22, y: 0.48)
        self.nestPos = CGPoint(x: -0.17, y: -0.275)
        
        self.spring = Spring(name: "spring1", zPosition: 0.250)
        self.cannon = Cannon(name: "cannon1", zPosition: 0.245)
        self.spring2 = Spring(name: "spring2", zPosition: 0.249)
        
        // initalize background
        self.addChild(Background(backgroundPic: "lv8_1.png"))
        // initialize boxes
        // set up static ground
        self.baseGround = GroundBase(img: "lv8_2.png")
        self.addChild(self.baseGround!)
        
        // float grounds
        self.floatGround = GroundFloat(posX: -0.108, posY: 0.102, img: "lv8_3.png")
        self.addChild(self.floatGround!)
        
        self.floatGround2 = GroundFloat(posX: -0.039, posY: 0.38, img: "lv8_4.png")
        self.addChild(self.floatGround2!)
        
        self.box = Box(posX: 0.092, posY: -0.415)
        self.addChild(self.box!)
        
        self.box2 = Box(posX: 0.32, posY: 0.395)
        self.addChild(self.box2!)
        
        self.box3 = Box(posX: -0.308, posY: -0.2)
        self.addChild(self.box3!)
        
        self.chain = Chain(posX: 0.092, box: self.box!, bridge: nil)
        self.addChild(self.chain!)
        
        self.chain2 = Chain(posX: 0.32, box: self.box2!, bridge: nil)
        self.addChild(self.chain2!)
        
        self.chain3 = Chain(posX: -0.308, box: self.box3!, bridge: nil)
        self.addChild(self.chain3!)
        
        self.death = DeathBarrier(sizeX: 80.0, posX: 0.092, posY: -0.323)
        self.addChild(self.death!)
        
        self.lever = Lever(posX: 0.23, posY: 0.118)
        self.addChild(self.lever!)
        
        self.lever2 = Lever(posX: -0.45, posY: 0.385)
        self.addChild(self.lever2!)
        
        self.lever3 = Lever(posX: 0.45, posY: 0.326)
        self.addChild(self.lever3!)
        
        self.lever4 = Lever(posX: -0.43, posY: -0.27)
        self.addChild(self.lever4!)
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
        
        self.dillo1!.atSpring(spring: self.spring2!)
        self.dillo2!.atSpring(spring: self.spring2!)
        self.dillo3!.atSpring(spring: self.spring2!)
        self.dillo4!.atSpring(spring: self.spring2!)
        self.dillo5!.atSpring(spring: self.spring2!)
        self.dillo6!.atSpring(spring: self.spring2!)
        self.dillo7!.atSpring(spring: self.spring2!)
        self.dillo8!.atSpring(spring: self.spring2!)
        
        self.spring2!.snap(scene: self, springButton: self.springButton!)
        self.spring2!.snapFinal()
        
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
        
        self.dillo1!.atLever(lever: self.lever3!)
        self.dillo2!.atLever(lever: self.lever3!)
        self.dillo3!.atLever(lever: self.lever3!)
        self.dillo4!.atLever(lever: self.lever3!)
        self.dillo5!.atLever(lever: self.lever3!)
        self.dillo6!.atLever(lever: self.lever3!)
        self.dillo7!.atLever(lever: self.lever3!)
        self.dillo8!.atLever(lever: self.lever3!)
        
        self.dillo1!.leaveLever(scene: self, lever: self.lever3!)
        self.dillo2!.leaveLever(scene: self, lever: self.lever3!)
        self.dillo3!.leaveLever(scene: self, lever: self.lever3!)
        self.dillo4!.leaveLever(scene: self, lever: self.lever3!)
        self.dillo5!.leaveLever(scene: self, lever: self.lever3!)
        self.dillo6!.leaveLever(scene: self, lever: self.lever3!)
        self.dillo7!.leaveLever(scene: self, lever: self.lever3!)
        self.dillo8!.leaveLever(scene: self, lever: self.lever3!)
        
        self.dillo1!.atLever(lever: self.lever4!)
        self.dillo2!.atLever(lever: self.lever4!)
        self.dillo3!.atLever(lever: self.lever4!)
        self.dillo4!.atLever(lever: self.lever4!)
        self.dillo5!.atLever(lever: self.lever4!)
        self.dillo6!.atLever(lever: self.lever4!)
        self.dillo7!.atLever(lever: self.lever4!)
        self.dillo8!.atLever(lever: self.lever4!)
        
        self.dillo1!.leaveLever(scene: self, lever: self.lever4!)
        self.dillo2!.leaveLever(scene: self, lever: self.lever4!)
        self.dillo3!.leaveLever(scene: self, lever: self.lever4!)
        self.dillo4!.leaveLever(scene: self, lever: self.lever4!)
        self.dillo5!.leaveLever(scene: self, lever: self.lever4!)
        self.dillo6!.leaveLever(scene: self, lever: self.lever4!)
        self.dillo7!.leaveLever(scene: self, lever: self.lever4!)
        self.dillo8!.leaveLever(scene: self, lever: self.lever4!)
        
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
        self.box!.stopMove(posY: 0.29, lever: self.lever!)
        self.chain!.position = CGPoint(x: Screen.screen!.width * self.chain!.posX!, y: (self.box!.frame.maxY - 5) + (self.chain!.frame.height / 2.0))
        
        self.box2!.startMove(up: true, lever: self.lever2!, chain: self.chain2!)
        self.box2!.continueMove(up: true)
        self.box2!.stopMove(posY: 0.57, lever: self.lever2!)
        self.chain2!.position = CGPoint(x: Screen.screen!.width * self.chain2!.posX!, y: (self.box2!.frame.maxY - 5) + (self.chain2!.frame.height / 2.0))
        
        self.box3!.startMove(up: true, lever: self.lever3!, chain: self.chain3!)
        self.box3!.continueMove(up: true)
        self.box3!.stopMove(posY: 0.35, lever: self.lever3!)
        self.chain3!.position = CGPoint(x: Screen.screen!.width * self.chain3!.posX!, y: (self.box3!.frame.maxY - 5) + (self.chain3!.frame.height / 2.0))
        
        self.box!.startMove(up: false, lever: self.lever4!, chain: self.chain!)
        self.box!.continueMove(up: false)
        self.box!.stopMove(posY: -0.32, lever: self.lever4!)
    
        self.spring!.moveWithBox()
        self.spring2!.moveWithBox()
        self.spring!.cleanUpMoveWithBox()
        self.spring2!.cleanUpMoveWithBox()
        self.cannon!.moveWithBox()
        self.cannon!.cleanUpMoveWithBox()
        // so the box can't send one of these skating around
        if(self.cannon!.physicsBody!.velocity.dx > 1.0) {
            self.cannon!.physicsBody!.velocity.dx = 0.0
        }
        if(self.spring!.physicsBody!.velocity.dx > 1.0) {
            self.spring!.physicsBody!.velocity.dx = 0.0
        }
        if(self.spring2!.physicsBody!.velocity.dx > 1.0) {
            self.spring2!.physicsBody!.velocity.dx = 0.0
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
            } else if(!self.spring2!.getSpawned() && self.springButton!.getNumberOfSprings() > 0) {
                self.spring2!.changeSpringInUse()
                self.spring2!.changeSpawned()
                self.spring2!.position = CGPoint(x: touchLocation.x, y: touchLocation.y)
                self.addChild(self.spring2!)
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
        self.spring2!.relocate(touchLocation: touchLocation, gameFinished: self.gameFinished!)
        self.cannon!.relocate(touchLocation: touchLocation, gameFinished: self.gameFinished!)
        self.cannon!.changeDirection(touchLocation: touchLocation, numberOfTouches: touchCount, gameFinished: self.gameFinished!)
    }
    
    
    override func touchesMovedLevelSpecific(touchLocation: CGPoint) {
        // drag spring
        self.spring!.drag(touchLocation: touchLocation)
        self.spring2!.drag(touchLocation: touchLocation)
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
        
        /*spring snap*/
        if(self.spring2!.getSpringInUse()) {
            Locker.changeItemLock()
            self.spring2!.changeSpringInUse()
            if(touchLocation.y < self.frame.height * -0.35) {
                // spring dropped below base ground, return it to toolbar
                self.spring2!.removeFromParent()
                self.spring2!.changeSpawned()
                self.spring2!.position = CGPoint(x: Screen.screen!.minX - 100, y: 0)
                self.springButton!.returnSpringToToolbar()
            } else {
                self.spring2!.setSnapping(snapping: true)
                self.spring2!.physicsBody!.isDynamic = true
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
        self.lever3!.pullLever(touchLocation: touchLocation)
        self.lever4!.pullLever(touchLocation: touchLocation)
    }
    
    
    override func didBeginLevelSpecific(contact: SKPhysicsContact) {
        
        self.spring!.stopSnap(contact: contact)
        self.spring2!.stopSnap(contact: contact)
        self.cannon!.stopSnap(contact: contact)
        
        // land on spring
        // hit ground after sprung
        // hit ground after cannon
        // hit death barrier
        if(contact.bodyA.node?.name == "dillo1" || contact.bodyB.node?.name == "dillo1") {
            self.dillo1!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo1!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo1!.landOnSpring(spring: self.spring2!)
            }
            self.dillo1!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo1!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo2" || contact.bodyB.node?.name == "dillo2") {
            self.dillo2!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo2!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo2!.landOnSpring(spring: self.spring2!)
            }
            self.dillo2!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo2!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo3" || contact.bodyB.node?.name == "dillo3") {
            self.dillo3!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo3!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo3!.landOnSpring(spring: self.spring2!)
            }
            self.dillo3!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo3!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo4" || contact.bodyB.node?.name == "dillo4") {
            self.dillo4!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo4!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo4!.landOnSpring(spring: self.spring2!)
            }
            self.dillo4!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo4!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo5" || contact.bodyB.node?.name == "dillo5") {
            self.dillo5!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo5!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo5!.landOnSpring(spring: self.spring2!)
            }
            self.dillo5!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo5!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo6" || contact.bodyB.node?.name == "dillo6") {
            self.dillo6!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo6!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo6!.landOnSpring(spring: self.spring2!)
            }
            self.dillo6!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo6!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo7" || contact.bodyB.node?.name == "dillo7") {
            self.dillo7!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo7!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo7!.landOnSpring(spring: self.spring2!)
            }
            self.dillo7!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo7!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo8" || contact.bodyB.node?.name == "dillo8") {
            self.dillo8!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo8!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo8!.landOnSpring(spring: self.spring2!)
            }
            self.dillo8!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo8!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }
    }
}
