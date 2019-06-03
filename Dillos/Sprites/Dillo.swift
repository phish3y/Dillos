/*dillo class*/
import SpriteKit

class Dillo: SKSpriteNode {
    
    private var refVel = CGFloat(0.0)
    private var directionFacing = 0
    private var sprung = 0
    private static var anyDilloSprung = 0
    private var cannon = 0
    private var whichCannon = ""
    private var readToFire = false
    private var atStart = true
    private var waitingForLever = false
    private var rolling = false
    private var doneRolling = false
    private var atLever = false
    static var dilloSpawnIndex = 1
    private var nest1: SKTexture?
    private var nest2: SKTexture?
    private var nest3: SKTexture?
    private var nest4: SKTexture?
    private var nest5: SKTexture?
    private var nest6: SKTexture?
    private var nest7: SKTexture?
    private var nest8: SKTexture?
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(posX: CGFloat, posY: CGFloat, zPos: CGFloat, name: String) {
        Dillo.dilloSpawnIndex = 1
        Dillo.anyDilloSprung = 0
        let texture = SKTexture(imageNamed: "drf5.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.name = name
        self.initSize()
        self.initPosition(posX: posX, posY: posY, zPos: zPos)
        self.initPhysics()
        self.nest1 = SKTexture(imageNamed: "nest1.png")
        self.nest2 = SKTexture(imageNamed: "nest2.png")
        self.nest3 = SKTexture(imageNamed: "nest3.png")
        self.nest4 = SKTexture(imageNamed: "nest4.png")
        self.nest5 = SKTexture(imageNamed: "nest5.png")
        self.nest6 = SKTexture(imageNamed: "nest6.png")
        self.nest7 = SKTexture(imageNamed: "nest7.png")
        self.nest8 = SKTexture(imageNamed: "nest8.png")
    }
    
    fileprivate func initSize() {
        self.size = CGSize(width: (self.size.width/2208) * Screen.screen!.width, height: (self.size.height/1242) * Screen.screen!.height)
    }
    
    fileprivate func initPosition(posX: CGFloat, posY: CGFloat, zPos: CGFloat) {
        self.position = CGPoint(x: (Screen.screen!.width) * posX, y: (Screen.screen!.height) * posY)
        self.zPosition = zPos
    }
    
    fileprivate func initPhysics() {
        self.physicsBody = SKPhysicsBody(circleOfRadius: (self.size.height / 2) - 3)
        self.physicsBody!.affectedByGravity = true
        self.physicsBody!.allowsRotation = false
        self.physicsBody!.isDynamic = true
        self.physicsBody!.restitution = 0.0
        self.physicsBody!.mass = 1.0
        self.physicsBody!.friction = 0.0
        self.physicsBody!.categoryBitMask = CollisionType.getDillo()
        self.physicsBody!.contactTestBitMask = CollisionType.getGround()
        self.physicsBody!.collisionBitMask = CollisionType.getGround()
    }
    
    func getAtStart() -> Bool {
        return self.atStart
    }
    
    func getVelocity() -> CGFloat {
        return self.refVel
    }
    
    static func getAnyDilloSprung() -> Int {
        return Dillo.anyDilloSprung
    }
    
    func rollIntoWalkAtBeginning(contact: SKPhysicsContact, gameStarted: Int, gameFinished: Bool) {
        if(gameStarted == 2 && !gameFinished && self.atStart == true && ((contact.bodyA.categoryBitMask == CollisionType.getDillo() && contact.bodyB.categoryBitMask == CollisionType.getGround()) || (contact.bodyB.categoryBitMask == CollisionType.getDillo() && contact.bodyA.categoryBitMask == CollisionType.getGround()))) {
            self.refVel = 30.0
            self.atStart = false
            self.rolling = true
            self.run(Animation.getOpenStartAnimation(), completion: {
                self.doneRolling = true
            })
        }
    }
    
    func walkAfterRoll(gameFinished: Bool) {
        if(self.doneRolling && self.rolling && !gameFinished) {
            self.rolling = false
            self.removeAllActions()
            if(!self.waitingForLever) {
                self.run(Animation.getForwardAnimation())
            } else {
                self.refVel = 0.0
            }
        }
    }
    
    // cannon
    func enterCannon(cannon: Cannon) {
        if(!self.atStart && !self.rolling && !cannon.getCannonInUse() && self.cannon == 0 && self.sprung == 0 && (self.position.y > cannon.position.y - 25 && self.position.y < cannon.position.y - 5)) {
            if(self.physicsBody!.velocity.dx > 0 && (cannon.getCannonFacing() == "right" && round(cannon.position.x) - 17 == round(self.position.x) || cannon.getCannonFacing() == "left" && round(cannon.position.x) + 17 == round(self.position.x)) || (self.physicsBody!.velocity.dx <= 0 && (cannon.getCannonFacing() == "right" && round(cannon.position.x) - 17 == round(self.position.x) || cannon.getCannonFacing() == "left" && round(cannon.position.x) + 17 == round(self.position.x)))) {
                self.cannon += 1
                cannon.incrementNoCannonMove()
                self.removeAllActions()
                self.removeFromParent()
                self.refVel = 0.0
                self.whichCannon = cannon.name!
                if(cannon.getCannonFacing() == "left") {
                    cannon.run(Animation.getCannonFireLeftAnimation(), completion: {
                        self.readToFire = !self.readToFire
                    })
                } else {
                    cannon.run(Animation.getCannonFireRightAnimation(), completion: {
                        self.readToFire = !self.readToFire
                    })
                }
            }
        }
    }
    
    func fire(scene: SKScene, cannon: Cannon) {
        if(self.cannon == 1 && cannon.getNoCannonMove() > 0 && self.whichCannon == cannon.name! && self.readToFire && !Lever.leverCheck) {
            self.readToFire = !self.readToFire
            self.cannon += 1
            if(cannon.getCannonFacing() == "right") {
                self.run(Animation.getDilloEnterBallRight())
            } else {
                self.run(Animation.getDilloEnterBallLeft())
            }
            scene.addChild(self)
            if(cannon.getCannonFacing() == "right") {
                self.position = CGPoint(x: cannon.frame.maxX - 25, y: cannon.frame.maxY - 32)
                self.refVel = 300.0
                cannon.run(Animation.getCannonFinishRight())
            } else {
                self.position = CGPoint(x: cannon.frame.minX + 25, y: cannon.frame.maxY - 32)
                self.refVel = -300.0
                cannon.run(Animation.getCannonFinishLeft())
            }
            self.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 320.0))
            cannon.decrementNoCannonMove()
            self.doneRolling = false
        }
    }
    
    func hitGroundAfterCannon(contact: SKPhysicsContact) {
        if(self.cannon == 2 && ((contact.bodyA.categoryBitMask == CollisionType.getDillo() && contact.bodyB.categoryBitMask == CollisionType.getGround()) || (contact.bodyA.categoryBitMask == CollisionType.getGround() && contact.bodyB.categoryBitMask == CollisionType.getDillo()))) {
            self.cannon += 1
            self.rolling = true
            if(self.refVel < CGFloat(0)) {
                if(self.directionFacing % 2 == 0) {
                    self.directionFacing += 1
                }
                self.run(Animation.getOpenLeftAnimation(), completion: {
                    self.doneRolling = !self.doneRolling
                })
                self.refVel = -30.0
            } else {
                if(self.directionFacing % 2 != 0) {
                    self.directionFacing -= 1
                }
                self.run(Animation.getOpenStartAnimation(), completion: {
                    self.doneRolling = !self.doneRolling
                })
                self.refVel = 30.0
            }
        }
    }
    
    func walkAfterCannon() {
        if(self.cannon == 3 && self.doneRolling) {
            self.doneRolling = !self.doneRolling
            self.rolling = false
            self.cannon -= 3
            if(!self.waitingForLever) {
                if(self.directionFacing % 2 == 0) {
                    self.run(Animation.getForwardAnimation())
                } else {
                    self.run(Animation.getBackwardAnimation())
                }
            } else {
                self.refVel = 0.0
            }
        }
    }
    
    /*lever*/
    func atLever(lever: Lever) {
        if(lever.leverPressed < 1 && round(self.position.x) == round(lever.position.x) && (self.position.y > lever.position.y - 15 && self.position.y < lever.position.y + 15)) {
            lever.leverPressed += 1
            self.atLever = !self.atLever
            self.removeAllActions()
            self.removeFromParent()
            self.refVel = 0.0
            lever.run(SKAction.animate(with: [SKTexture(imageNamed: "lever2.png")], timePerFrame: 0.01))
        }
    }
    
    func stopForLever() {
        if(!self.waitingForLever && Lever.leverCheck && self.cannon == 0 && self.sprung == 0) {
            self.refVel = 0.0
            self.removeAllActions()
            self.waitingForLever = !self.waitingForLever
        }
    }
    
    func startAfterLever() {
        if(self.waitingForLever && !Lever.leverCheck) {
            self.waitingForLever = !self.waitingForLever
            if(self.directionFacing % 2 == 0) {
                self.refVel = 30.0
                self.run(Animation.getForwardAnimation())
            } else {
                self.refVel = -30.0
                self.run(Animation.getBackwardAnimation())
            }
        }
    }
    
    func leaveLever(scene: SKScene, lever: Lever) {
        if(self.atLever && lever.leverPressed == 3) {
            self.atLever = !self.atLever
            lever.leverPressed += 1
            lever.run(Animation.getLeverFinishAnimation())
            scene.addChild(self)
            if(self.directionFacing % 2 == 0) {
                self.refVel = 30.0
                self.run(Animation.getForwardAnimation())
            } else {
                self.refVel = -30.0
                self.run(Animation.getBackwardAnimation())
            }
        }
    }
    
    /*nest*/
    func atNest(nest: Nest, dillosFinished: Int) -> Int {
        var finished = dillosFinished
        if (round(self.position.x) == round(nest.position.x) && (self.position.y > nest.position.y - 25 && self.position.y < nest.position.y + 25)) {
            self.removeFromParent()
            self.removeAllActions()
            self.position = CGPoint(x: -100.0, y: 0.0)
            if(dillosFinished == 0) {
                Animation.changeNestAnimation(texture: self.nest1!)
                nest.run(Animation.getNestAnimation())
                Animation.changeNestAnimation(texture: self.nest2!)
            }else if(dillosFinished == 1) {
                nest.run(Animation.getNestAnimation())
                Animation.changeNestAnimation(texture: self.nest3!)
            }else if(dillosFinished == 2) {
                nest.run(Animation.getNestAnimation())
                Animation.changeNestAnimation(texture: self.nest4!)
            }else if(dillosFinished == 3) {
                nest.run(Animation.getNestAnimation())
                Animation.changeNestAnimation(texture: self.nest5!)
            }else if(dillosFinished == 4) {
                nest.run(Animation.getNestAnimation())
                Animation.changeNestAnimation(texture: self.nest6!)
            }else if(dillosFinished == 5) {
                nest.run(Animation.getNestAnimation())
                Animation.changeNestAnimation(texture: self.nest7!)
            }else if(dillosFinished == 6) {
                nest.run(Animation.getNestAnimation())
                Animation.changeNestAnimation(texture: self.nest8!)
            }else if(dillosFinished == 7) {
                nest.run(Animation.getNestAnimation())
            }
            finished += 1
        }
        return finished
    }
    
    func hitWall(gameFinished: Bool) {
        if(self.physicsBody!.velocity.dx <= 1.0 && self.physicsBody!.velocity.dx >= -1.0 && self.physicsBody!.velocity.dy <= 1.0 && self.physicsBody!.velocity.dy >= -1.0 && !self.atStart && !self.rolling && self.sprung == 0 && self.cannon == 0 && !gameFinished && !Lever.leverCheck) {
            self.refVel *= CGFloat(-1.0)
            self.removeAllActions()
            if(self.directionFacing % 2 == 0) {
                self.run(Animation.getBackwardAnimation())
                self.directionFacing += 1
            } else {
                self.run(Animation.getForwardAnimation())
                self.directionFacing -= 1
            }
        }
    }
    
    func hitDeathBarrier(contact: SKPhysicsContact, dillosDead: Int) -> Int {
        var dillosDeadRet = dillosDead
        if((contact.bodyA.categoryBitMask == CollisionType.getDillo() && contact.bodyB.categoryBitMask == CollisionType.getDeath()) || ( contact.bodyA.categoryBitMask == CollisionType.getDeath() && contact.bodyB.categoryBitMask == CollisionType.getDillo() ) ) {
            self.removeFromParent()
            self.removeAllActions()
            self.position = CGPoint(x: frame.width * -1, y: 1)
            dillosDeadRet += 1
        }
        return dillosDeadRet
    }
    
    /*spring*/
    func atSpring(spring: Spring) {
        if(!self.atStart && !self.rolling && !spring.getSpringInUse() && self.sprung == 0 && self.cannon == 0 && round(self.position.x) == round(spring.position.x) && (self.position.y > spring.position.y - 20 && self.position.y < spring.position.y + 15)) {
            self.sprung += 1
            Dillo.anyDilloSprung += 1
            self.removeAllActions()
            self.refVel = 0.0
            self.physicsBody!.applyImpulse(CGVector(dx: 0.0, dy: 200.0))
            self.physicsBody!.collisionBitMask = CollisionType.getSpring()
            self.physicsBody!.contactTestBitMask = CollisionType.getSpring()
        }
    }
    
    func landOnSpring(spring: Spring) {
        if(self.sprung == 1  && self.physicsBody!.velocity.dy < 1.0) {
            spring.run(Animation.getSpringAnimation())
            self.physicsBody!.applyImpulse(CGVector(dx: 0.0, dy: 375.0))
            if(self.directionFacing % 2 == 0){
                self.refVel = 70.0
            }else {
                self.refVel = -70.0
            }
            self.sprung += 1
            Dillo.anyDilloSprung -= 1
            self.physicsBody!.collisionBitMask = CollisionType.getGround()
            self.physicsBody!.contactTestBitMask = CollisionType.getGround()
        }
    }
    
    func hitGroundAfterSpring(contact: SKPhysicsContact, spring: Spring) {
        if(self.sprung == 2 && ((contact.bodyA.categoryBitMask == CollisionType.getDillo() && contact.bodyB.categoryBitMask == CollisionType.getGround()) || (contact.bodyA.categoryBitMask == CollisionType.getGround() && contact.bodyB.categoryBitMask == CollisionType.getDillo()))) {
            self.sprung = 0
            if(!self.waitingForLever) {
                if(self.directionFacing % 2 == 0) {
                    self.refVel = 30.0
                    self.run(Animation.getForwardAnimation())
                }else {
                    self.refVel = -30.0
                    self.run(Animation.getBackwardAnimation())
                }
            } else {
                self.refVel = 0.0
            }
        }
    }
}
