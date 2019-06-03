/*spring class*/
import SpriteKit
class Spring: SKSpriteNode {

    // this will be true if the spring is being drug around
    private var springInUse = false
    private var spawned = false
    private var snapping = false
    private var finalSnap = false
    private var movedWithBox = false
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(name: String, zPosition: CGFloat) {
        let texture = SKTexture(imageNamed: "spring2.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.name = name
        self.initSize()
        self.initPosition(zPosition: zPosition)
        self.initPhysics(name: name)
    }
    
    fileprivate func initSize() {
        self.size = CGSize(width: (self.size.width/2204) * Screen.screen!.width, height: (self.size.height/1242) * Screen.screen!.height)
    }
    
    fileprivate func initPosition(zPosition: CGFloat) {
        self.position = CGPoint(x: Screen.screen!.width * -1.5, y: Screen.screen!.height * 0.0)
        //.25
        self.zPosition = zPosition
    }
    
    fileprivate func initPhysics(name: String) {
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: self.size.height - 2))
        self.physicsBody!.isDynamic = false
        self.physicsBody!.usesPreciseCollisionDetection = false
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.allowsRotation = false
        self.physicsBody!.restitution = 0.0
        self.physicsBody!.categoryBitMask = CollisionType.getSpring()
        self.physicsBody!.contactTestBitMask = CollisionType.getGround()
        self.physicsBody!.collisionBitMask = CollisionType.getNoInteraction()
    }
    
    func setSnapping(snapping: Bool) {
        self.snapping = snapping
    }
    
    func snap(scene: SKScene, springButton: SpringButton) {
        if(self.snapping) {
            let bottomPoint = CGPoint(x: self.frame.midX, y: self.frame.minY)
            if(bottomPoint.y < scene.frame.height * -0.35) {
                // spring dropped below base ground, return it to toolbar
                self.removeFromParent()
                self.spawned = !self.spawned
                self.position = CGPoint(x: Screen.screen!.minX - 100, y: 0)
                springButton.returnSpringToToolbar()
                self.snapping = false
                self.physicsBody!.isDynamic = false
            } else {
                self.position = CGPoint(x: self.position.x, y: self.position.y - 3)
            }
        }
    }
    
    func stopSnap(contact: SKPhysicsContact) {
        if(self.snapping && ((contact.bodyB.categoryBitMask == CollisionType.getGround() && contact.bodyA.categoryBitMask == CollisionType.getSpring()) || (contact.bodyB.categoryBitMask == CollisionType.getSpring() && contact.bodyA.categoryBitMask == CollisionType.getGround()))) {
            self.snapping = false
            self.physicsBody!.isDynamic = false
            self.finalSnap = true
        }
    }
    
    func snapFinal() {
        if(self.finalSnap) {
            self.finalSnap = false
            //self.position = CGPoint(x: self.position.x, y: self.position.y - 1)
        }
    }
    
    func moveWithBox() {
        if(!self.movedWithBox && Lever.leverCheck) {
            self.movedWithBox = !self.movedWithBox
            //self.position.y = self.position.y + 1
            self.physicsBody!.isDynamic = true
            self.physicsBody!.affectedByGravity = true
            self.physicsBody!.collisionBitMask = CollisionType.getGround()
        }
    }
    
    func cleanUpMoveWithBox() {
        if(self.movedWithBox && !Lever.leverCheck) {
            self.movedWithBox = !self.movedWithBox
            self.physicsBody!.isDynamic = false
            self.physicsBody!.affectedByGravity = false
            self.physicsBody!.collisionBitMask = CollisionType.getNoInteraction()
        }
    }
    
    func getSpringInUse() -> Bool {
        return self.springInUse
    }
    
    func changeSpringInUse() {
        self.springInUse = !self.springInUse
    }
    
    func getSpawned() -> Bool {
        return self.spawned
    }
    
    func changeSpawned() {
        self.spawned = !self.spawned
    }
    
    func relocate(touchLocation: CGPoint, gameFinished: Bool) {
        if(!self.springInUse && !Lever.leverCheck && Dillo.getAnyDilloSprung() == 0 && !gameFinished && (self.position.y > touchLocation.y - 25 && self.position.y < touchLocation.y + 25 && self.position.x > touchLocation.x - 25 && self.position.x < touchLocation.x + 25) && !Locker.getItemLock()) {
            Locker.changeItemLock()
            self.position = CGPoint(x: touchLocation.x, y: touchLocation.y)
            self.springInUse = !self.springInUse
        }
    }
    
    func drag(touchLocation: CGPoint) {
        if (self.springInUse && Dillo.getAnyDilloSprung() == 0) {
            self.position = CGPoint(x: touchLocation.x, y: touchLocation.y)
        }
    }
}
