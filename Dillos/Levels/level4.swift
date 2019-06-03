// Dillos Level 4
import SpriteKit

class Level4: Level {
    
    var spring: Spring?
   
    var cannon: Cannon?
    var cannon2: Cannon?
    
    var baseGround: GroundBase?
    var floatGround: GroundFloat?
    
    var deathBarrier: DeathBarrier?
    
    
    override func didMoveLevelSpecific() {
        self.currentLevel = 4
        self.nextLevel = "p1l5"
        self.nextLevelFull = "Level5"
        self.numberOfSprings = 1
        self.numberOfCannons = 2
        self.dilloPos = CGPoint(x: -0.48, y: 0.48)
        self.nestPos = CGPoint(x: 0.41, y: -0.05)
        
        self.spring = Spring(name: "spring1", zPosition: 0.25)
        
        self.cannon = Cannon(name: "cannon1", zPosition: 0.245)
        self.cannon2 = Cannon(name: "cannon2", zPosition: 0.246)
        
        // initalize background
        self.addChild(Background(backgroundPic: "lv4_1.png"))
        // set up static ground
        self.baseGround = GroundBase(img: "lv4_2.png")
        self.addChild(self.baseGround!)
        
        self.deathBarrier = DeathBarrier(sizeX: Screen.screen!.width * 0.3, posX: 0.17, posY: -0.21)
        self.addChild(self.deathBarrier!)
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
        
        // cannon2
        self.dillo1!.enterCannon(cannon: self.cannon2!)
        self.dillo1!.fire(scene: self, cannon: self.cannon2!)
        self.dillo2!.enterCannon(cannon: self.cannon2!)
        self.dillo2!.fire(scene: self, cannon: self.cannon2!)
        self.dillo3!.enterCannon(cannon: self.cannon2!)
        self.dillo3!.fire(scene: self, cannon: self.cannon2!)
        self.dillo4!.enterCannon(cannon: self.cannon2!)
        self.dillo4!.fire(scene: self, cannon: self.cannon2!)
        self.dillo5!.enterCannon(cannon: self.cannon2!)
        self.dillo5!.fire(scene: self, cannon: self.cannon2!)
        self.dillo6!.enterCannon(cannon: self.cannon2!)
        self.dillo6!.fire(scene: self, cannon: self.cannon2!)
        self.dillo7!.enterCannon(cannon: self.cannon2!)
        self.dillo7!.fire(scene: self, cannon: self.cannon2!)
        self.dillo8!.enterCannon(cannon: self.cannon2!)
        self.dillo8!.fire(scene: self, cannon: self.cannon2!)
        
        self.cannon2!.snap(scene: self, cannonButton: self.cannonButton!)
        self.cannon2!.snapFinal()
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
            } else if(!self.cannon2!.getSpawned() && self.cannonButton!.getNumberOfCannons() > 0) {
                self.cannon2!.changeCannonInUse()
                self.cannon2!.changeSpawned()
                self.cannon2!.position = CGPoint(x: touchLocation.x, y: touchLocation.y)
                self.addChild(self.cannon2!)
            }
            self.cannonButton!.touchBegin()
        }
        
        // spring relocation
        self.spring!.relocate(touchLocation: touchLocation, gameFinished: self.gameFinished!)
        // cannon relocate
        self.cannon!.relocate(touchLocation: touchLocation, gameFinished: self.gameFinished!)
        self.cannon2!.relocate(touchLocation: touchLocation, gameFinished: self.gameFinished!)
        self.cannon!.changeDirection(touchLocation: touchLocation, numberOfTouches: touchCount, gameFinished: self.gameFinished!)
        self.cannon2!.changeDirection(touchLocation: touchLocation, numberOfTouches: touchCount, gameFinished: self.gameFinished!)
    }
    
    
    override func touchesMovedLevelSpecific(touchLocation: CGPoint) {
        // drag spring
        self.spring!.drag(touchLocation: touchLocation)
        // drag cannon
        self.cannon!.drag(touchLocation: touchLocation)
        self.cannon2!.drag(touchLocation: touchLocation)
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
        
        // cannon1 snap
        if(self.cannon!.getCannonInUse()) {
            Locker.changeItemLock()
            self.cannon!.changeCannonInUse()
            if(touchLocation.y < self.frame.height * -0.35) {
                // spring dropped below base ground, return it to toolbar
                self.cannon!.removeFromParent()
                self.cannon!.changeSpawned()
                self.cannon!.position = CGPoint(x: Screen.screen!.minX - 100, y: 0)
                self.cannonButton!.returnCannonToToolbar()
            } else {
                self.cannon!.setSnapping(snapping: true)
                self.cannon!.physicsBody!.isDynamic = true
            }
        }
        
        // cannon2 snap
        if(self.cannon2!.getCannonInUse()) {
            Locker.changeItemLock()
            self.cannon2!.changeCannonInUse()
            if(touchLocation.y < self.frame.height * -0.35) {
                // spring dropped below base ground, return it to toolbar
                self.cannon2!.removeFromParent()
                self.cannon2!.changeSpawned()
                self.cannon2!.position = CGPoint(x: Screen.screen!.minX - 100, y: 0)
                self.cannonButton!.returnCannonToToolbar()
            } else {
                self.cannon2!.setSnapping(snapping: true)
                self.cannon2!.physicsBody!.isDynamic = true
            }
        }
    }
    
    
    override func didBeginLevelSpecific(contact: SKPhysicsContact) {
        self.spring!.stopSnap(contact: contact)
        self.cannon!.stopSnap(contact: contact)
        self.cannon2!.stopSnap(contact: contact)
        
        // land on spring
        // hit ground after sprung
        // hit ground after cannon
        if(contact.bodyA.node?.name == "dillo1" || contact.bodyB.node?.name == "dillo1") {
            self.dillo1!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo1!.landOnSpring(spring: self.spring!)
            }
            self.dillo1!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            self.dillosDead = self.dillo1!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo2" || contact.bodyB.node?.name == "dillo2") {
            self.dillo2!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo2!.landOnSpring(spring: self.spring!)
            }
            self.dillo2!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            self.dillosDead = self.dillo2!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo3" || contact.bodyB.node?.name == "dillo3") {
            self.dillo3!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo3!.landOnSpring(spring: self.spring!)
            }
            self.dillo3!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            self.dillosDead = self.dillo3!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo4" || contact.bodyB.node?.name == "dillo4") {
            self.dillo4!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo4!.landOnSpring(spring: self.spring!)
            }
            self.dillo4!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            self.dillosDead = self.dillo4!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo5" || contact.bodyB.node?.name == "dillo5") {
            self.dillo5!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo5!.landOnSpring(spring: self.spring!)
            }
            self.dillo5!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            self.dillosDead = self.dillo5!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo6" || contact.bodyB.node?.name == "dillo6") {
            self.dillo6!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo6!.landOnSpring(spring: self.spring!)
            }
            self.dillo6!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            self.dillosDead = self.dillo6!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo7" || contact.bodyB.node?.name == "dillo7") {
            self.dillo7!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo7!.landOnSpring(spring: self.spring!)
            }
            self.dillo7!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            self.dillosDead = self.dillo7!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }else if(contact.bodyA.node?.name == "dillo8" || contact.bodyB.node?.name == "dillo8") {
            self.dillo8!.hitGroundAfterCannon(contact: contact)
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo8!.landOnSpring(spring: self.spring!)
            }
            self.dillo8!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            self.dillosDead = self.dillo8!.hitDeathBarrier(contact: contact, dillosDead: self.dillosDead!)
        }
    }
}
