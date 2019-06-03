//  Dillos Level 1
import SpriteKit

class Level1: Level {
        
    var spring: Spring?
    var box: Box?
    var chain: Chain?
    
    var baseGround: GroundBase?
    
    
    override func didMoveLevelSpecific() {
        self.currentLevel = 1
        self.nextLevel = "p1l2"
        self.nextLevelFull = "Level2"
        self.numberOfSprings = 1
        self.numberOfCannons = 0
        self.dilloPos = CGPoint(x: -0.48, y: 0.48)
        self.nestPos = CGPoint(x: 0.38, y: -0.02)
        
        //spring
        self.spring = Spring(name: "spring1", zPosition: 0.25)
        
        // box
        self.box = Box(posX: 0.125, posY: 0.047)
        self.addChild(self.box!)
        
        // chain for box
        self.chain = Chain(posX: 0.125, box: self.box!, bridge: nil)
        self.addChild(self.chain!)
        
        // background
        self.addChild(Background(backgroundPic: "lv1_1.png"))
        
        // base ground
        self.baseGround = GroundBase(img: "lv1_2.png")
        self.addChild(self.baseGround!)
        
    }
    
    override func updateLevelSpecific() {
        
        // dillo at spring
        self.dillo1!.atSpring(spring: self.spring!)
        self.dillo2!.atSpring(spring: self.spring!)
        self.dillo3!.atSpring(spring: self.spring!)
        self.dillo4!.atSpring(spring: self.spring!)
        self.dillo5!.atSpring(spring: self.spring!)
        self.dillo6!.atSpring(spring: self.spring!)
        self.dillo7!.atSpring(spring: self.spring!)
        self.dillo8!.atSpring(spring: self.spring!)
        
        // spring snap to ground
        self.spring!.snap(scene: self, springButton: self.springButton!)
        self.spring!.snapFinal()
    }
    
    override func touchesBeganLevelSpecific(touchLocation: CGPoint, touchCount: Int) {
        
        // spring button
        if(self.springButton!.contains(touchLocation) && !self.gameFinished! && self.gameStarted != 0 && !Locker.getButtonLock()) {
            if(self.springButton!.getNumberOfSprings() > 0) {
                self.spring!.changeSpringInUse()
                self.spring!.changeSpawned()
                self.spring!.position = CGPoint(x: touchLocation.x, y: touchLocation.y)
                self.addChild(self.spring!)
            }
            self.springButton!.touchBegin()
        }
        
        // spring relocation
        self.spring!.relocate(touchLocation: touchLocation, gameFinished: self.gameFinished!)
    }
    
    
    override func touchesMovedLevelSpecific(touchLocation: CGPoint) {
        
        // drag spring
        self.spring!.drag(touchLocation: touchLocation)
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
    }
    
    override func didBeginLevelSpecific(contact: SKPhysicsContact) {
        self.spring!.stopSnap(contact: contact)
        
        // land on spring
        // hit ground after sprung
        if(contact.bodyA.node?.name == "dillo1" || contact.bodyB.node?.name == "dillo1") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo1!.landOnSpring(spring: self.spring!)
            }
            self.dillo1!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
        } else if(contact.bodyA.node?.name == "dillo2" || contact.bodyB.node?.name == "dillo2") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo2!.landOnSpring(spring: self.spring!)
            }
            self.dillo2!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
        } else if(contact.bodyA.node?.name == "dillo3" || contact.bodyB.node?.name == "dillo3") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo3!.landOnSpring(spring: self.spring!)
            }
            self.dillo3!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
        } else if(contact.bodyA.node?.name == "dillo4" || contact.bodyB.node?.name == "dillo4") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo4!.landOnSpring(spring: self.spring!)
            }
            self.dillo4!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
        } else if(contact.bodyA.node?.name == "dillo5" || contact.bodyB.node?.name == "dillo5") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo5!.landOnSpring(spring: self.spring!)
            }
            self.dillo5!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
        } else if(contact.bodyA.node?.name == "dillo6" || contact.bodyB.node?.name == "dillo6") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo6!.landOnSpring(spring: self.spring!)
            }
            self.dillo6!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
        } else if(contact.bodyA.node?.name == "dillo7" || contact.bodyB.node?.name == "dillo7") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo7!.landOnSpring(spring: self.spring!)
            }
            self.dillo7!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
        } else if(contact.bodyA.node?.name == "dillo8" || contact.bodyB.node?.name == "dillo8") {
            if(contact.bodyA.node?.name == "spring1" || contact.bodyB.node?.name == "spring1") {
                self.dillo8!.landOnSpring(spring: self.spring!)
            }
            self.dillo8!.hitGroundAfterSpring(contact: contact, spring: self.spring!)
        }
    }
}
