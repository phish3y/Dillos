// Dillos Level 7
import SpriteKit

class Level7: Level {
    
    var spring: Spring?
    var spring2: Spring?

    var baseGround: GroundBase?
    var floatGround: GroundFloat?
    var floatGround2: GroundFloat?
    var floatGround3: GroundFloat?
    var floatGround4: GroundFloat?
    
    var box: Box?
    var box2: Box?
    var bridge: Bridge?
    var chain2: Chain?
    var chain: Chain?
    
    var death: DeathBarrier?

    var lever: Lever?
    var lever2: Lever?
    var lever3: Lever?
    
    
    override func didMoveLevelSpecific() {
        self.currentLevel = 7
        self.nextLevel = "p1l8"
        self.nextLevelFull = "Level8"
        self.numberOfSprings = 2
        self.numberOfCannons = 0
        self.dilloPos = CGPoint(x: 0.45, y: 0.48)
        self.nestPos = CGPoint(x: -0.03, y: -0.04)
        
        self.spring = Spring(name: "spring1", zPosition: 0.250)
        self.spring2 = Spring(name: "spring2", zPosition: 0.249)
        
        // initalize background
        self.addChild(Background(backgroundPic: "lv7_1.png"))
        // initialize boxes
        // set up static ground
        self.baseGround = GroundBase(img: "lv7_2.png")
        self.addChild(self.baseGround!)
        
        // float grounds
        self.floatGround = GroundFloat(posX: -0.03, posY: -0.005, img: "lv7_3.png")
        self.addChild(self.floatGround!)
        
        self.floatGround2 = GroundFloat(posX: -0.255, posY: 0.27, img: "lv7_4.png")
        self.addChild(self.floatGround2!)
        
        self.floatGround3 = GroundFloat(posX: -0.327, posY: -0.086, img: "lv7_6.png")
        self.addChild(self.floatGround3!)
        
        self.floatGround4 = GroundFloat(posX: 0.228, posY: 0.39, img: "lv7_5.png")
        self.addChild(self.floatGround4!)
        
        self.box = Box(posX: 0.158, posY: -0.004)
        self.addChild(self.box!)
        
        self.box2 = Box(posX: -0.437, posY: -0.405)
        self.addChild(self.box2!)
        
        self.bridge = Bridge(posX: -0.214, posY: -0.31)
        self.addChild(self.bridge!)
        
        self.chain = Chain(posX: 0.158, box: self.box!, bridge: nil)
        self.addChild(self.chain!)
        
        self.chain2 = Chain(posX: -0.434, box: self.box2!, bridge: nil)
        self.addChild(self.chain2!)
        
        self.death = DeathBarrier(sizeX: 90.0, posX: -0.43, posY: -0.348)
        self.addChild(self.death!)
        
        self.lever = Lever(posX: -0.342, posY: -0.257)
        self.addChild(self.lever!)
        
        self.lever2 = Lever(posX: 0.3, posY: 0.387)
        self.addChild(self.lever2!)
        
        self.lever3 = Lever(posX: 0.07, posY: -0.024)
        self.addChild(self.lever3!)
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
        self.box!.startMove(up: true, lever: self.lever2!, chain: self.chain!)
        self.box!.continueMove(up: true)
        self.box!.stopMove(posY: 0.28, lever: self.lever2!)
        self.chain!.position = CGPoint(x: Screen.screen!.width * self.chain!.posX!, y: (self.box!.frame.maxY - 5) + (self.chain!.frame.height / 2.0))
        
        self.box2!.startMove(up: true, lever: self.lever!, chain: self.chain2!)
        self.box2!.continueMove(up: true)
        self.box2!.stopMove(posY: 0.339, lever: self.lever!)
        self.chain2!.position = CGPoint(x: Screen.screen!.width * self.chain2!.posX!, y: (self.box2!.frame.maxY - 5) + (self.chain2!.frame.height / 2.0))
        
        self.box2!.startMove(up: false, lever: self.lever3!, chain: self.chain2!)
        self.box2!.continueMove(up: false)
        self.box2!.stopMove(posY: 0.112, lever: self.lever3!)
                
        self.spring!.moveWithBox()
        self.spring2!.moveWithBox()
        self.spring!.cleanUpMoveWithBox()
        self.spring2!.cleanUpMoveWithBox()
        // so the box can't send one of these skating around
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
    
        // spring relocation
        self.spring!.relocate(touchLocation: touchLocation, gameFinished: self.gameFinished!)
        self.spring2!.relocate(touchLocation: touchLocation, gameFinished: self.gameFinished!)
    }
    
    
    override func touchesMovedLevelSpecific(touchLocation: CGPoint) {
        // drag spring
        self.spring!.drag(touchLocation: touchLocation)
        self.spring2!.drag(touchLocation: touchLocation)
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

        // activate lever
        self.lever!.pullLever(touchLocation: touchLocation)
        self.lever2!.pullLever(touchLocation: touchLocation)
        self.lever3!.pullLever(touchLocation: touchLocation)
    }
    
    
    override func didBeginLevelSpecific(contact: SKPhysicsContact) {
        self.spring!.stopSnap(contact: contact)
        self.spring2!.stopSnap(contact: contact)
        
        // land on spring
        // hit ground after sprung
        if(contact.bodyA.node?.name == "dillo1" || contact.bodyB.node?.name == "dillo1") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo1!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo1!.landOnSpring(spring: self.spring2!)
            }
            self.dillo1!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo1!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo2" || contact.bodyB.node?.name == "dillo2") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo2!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo2!.landOnSpring(spring: self.spring2!)
            }
            self.dillo2!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo2!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo3" || contact.bodyB.node?.name == "dillo3") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo3!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo3!.landOnSpring(spring: self.spring2!)
            }
            self.dillo3!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo3!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo4" || contact.bodyB.node?.name == "dillo4") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo4!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo4!.landOnSpring(spring: self.spring2!)
            }
            self.dillo4!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo4!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo5" || contact.bodyB.node?.name == "dillo5") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo5!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo5!.landOnSpring(spring: self.spring2!)
            }
            self.dillo5!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo5!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo6" || contact.bodyB.node?.name == "dillo6") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo6!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo6!.landOnSpring(spring: self.spring2!)
            }
            self.dillo6!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo6!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo7" || contact.bodyB.node?.name == "dillo7") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo7!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo7!.landOnSpring(spring: self.spring2!)
            }
            self.dillo7!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            //death barrier
            self.dillosDead = self.dillo7!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo8" || contact.bodyB.node?.name == "dillo8") {
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
