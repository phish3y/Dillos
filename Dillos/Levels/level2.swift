//  Dillos Level 1
import SpriteKit

class Level2: Level {
    
    var spring: Spring?
    var spring2: Spring?
    
    var leftChain: Chain?
    var rightChain: Chain?
    var bridge: Bridge?

    var baseGround: GroundBase?
    
    
    override func didMoveLevelSpecific() {
        self.currentLevel = 2
        self.nextLevel = "p1l3"
        self.nextLevelFull = "Level3"
        self.numberOfSprings = 2
        self.numberOfCannons = 0
        self.dilloPos = CGPoint(x: 0.17, y: 0.48)
        self.nestPos = CGPoint(x: 0.38, y: 0.142)
        
        self.spring = Spring(name: "spring1", zPosition: 0.25)
        self.spring2 = Spring(name: "spring2", zPosition: 0.25)
        
        self.bridge = Bridge(posX: -0.02, posY: 0.208)
        self.addChild(self.bridge!)
        
        self.rightChain = Chain(posX: 0.13, box: nil, bridge: self.bridge!)
        self.addChild(self.rightChain!)
        
        self.leftChain = Chain(posX: -0.17, box: nil, bridge: self.bridge!)
        self.addChild(self.leftChain!)
        
        self.addChild(Background(backgroundPic: "lv2_1.png"))
        self.baseGround = GroundBase(img: "lv2_2.png")
        self.addChild(self.baseGround!)
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
        
        self.dillo1!.atSpring(spring: self.spring2!)
        self.dillo2!.atSpring(spring: self.spring2!)
        self.dillo3!.atSpring(spring: self.spring2!)
        self.dillo4!.atSpring(spring: self.spring2!)
        self.dillo5!.atSpring(spring: self.spring2!)
        self.dillo6!.atSpring(spring: self.spring2!)
        self.dillo7!.atSpring(spring: self.spring2!)
        self.dillo8!.atSpring(spring: self.spring2!)
        
        self.spring!.snap(scene: self, springButton: self.springButton!)
        self.spring!.snapFinal()
        self.spring2!.snap(scene: self, springButton: self.springButton!)
        self.spring2!.snapFinal()
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
        
        // spring snap
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
            self.dillo1!.hitGroundAfterSpring(contact: contact, spring: self.spring2!)
        }else if(contact.bodyA.node?.name == "dillo2" || contact.bodyB.node?.name == "dillo2") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo2!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo2!.landOnSpring(spring: self.spring2!)
            }
            self.dillo2!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            self.dillo2!.hitGroundAfterSpring(contact: contact, spring: self.spring2!)
        }else if(contact.bodyA.node?.name == "dillo3" || contact.bodyB.node?.name == "dillo3") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo3!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo3!.landOnSpring(spring: self.spring2!)
            }
            self.dillo3!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            self.dillo3!.hitGroundAfterSpring(contact: contact, spring: self.spring2!)
        }else if(contact.bodyA.node?.name == "dillo4" || contact.bodyB.node?.name == "dillo4") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo4!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo4!.landOnSpring(spring: self.spring2!)
            }
             self.dillo4!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
             self.dillo4!.hitGroundAfterSpring(contact: contact, spring: self.spring2!)
        }else if(contact.bodyA.node?.name == "dillo5" || contact.bodyB.node?.name == "dillo5") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo5!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo5!.landOnSpring(spring: self.spring2!)
            }
            self.dillo5!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            self.dillo5!.hitGroundAfterSpring(contact: contact, spring: self.spring2!)
        }else if(contact.bodyA.node?.name == "dillo6" || contact.bodyB.node?.name == "dillo6") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo6!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo6!.landOnSpring(spring: self.spring2!)
            }
            self.dillo6!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            self.dillo6!.hitGroundAfterSpring(contact: contact, spring: self.spring2!)
        }else if(contact.bodyA.node?.name == "dillo7" || contact.bodyB.node?.name == "dillo7") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo7!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo7!.landOnSpring(spring: self.spring2!)
            }
            self.dillo7!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            self.dillo7!.hitGroundAfterSpring(contact: contact, spring: self.spring2!)
        }else if(contact.bodyA.node?.name == "dillo8" || contact.bodyB.node?.name == "dillo8") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo8!.landOnSpring(spring: self.spring!)
            } else if(contact.bodyA.node?.name == "spring2" || contact.bodyB.node?.name == "spring2") {
                self.dillo8!.landOnSpring(spring: self.spring2!)
            }
            self.dillo8!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
            self.dillo8!.hitGroundAfterSpring(contact: contact, spring: self.spring2!)
        }
    }
}
