/*cannon class*/
import SpriteKit
class Cannon: SKSpriteNode {
    
    fileprivate var cannonInUse = false
    fileprivate var noCannonMove = 0
    fileprivate var cannonFacing = "right"
    fileprivate var spawned = false
    fileprivate var snapping = false
    fileprivate var finalSnap = false
    fileprivate var movedWithBox = false
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(name: String, zPosition: CGFloat) {
        let texture = SKTexture(imageNamed: "cannon1.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.name = name
        self.initSize(zPosition: zPosition)
        self.initPosition(zPosition: zPosition)
        self.initPhysics(img: "cannon1.png")
    }
    
    fileprivate func initSize(zPosition: CGFloat) {
        self.size = CGSize(width: (self.size.width/2208) * Screen.screen!.width, height: (self.size.height/1242) * Screen.screen!.height)
    }
    
    fileprivate func initPosition(zPosition: CGFloat) {
        self.zPosition = zPosition
        self.position = CGPoint(x: Screen.screen!.width * -1.5, y: Screen.screen!.height * 0.0)
        //.25
        self.zPosition = zPosition
    }
    
    fileprivate func initPhysics(img: String) {
        self.setPhysics(img: img)
    }
    
    func setSnapping(snapping: Bool) {
        self.snapping = snapping
    }
    
    func snap(scene: SKScene, cannonButton: CannonButton) {
        if(self.snapping) {
            let bottomPoint = CGPoint(x: self.frame.midX, y: self.frame.minY)
            if(bottomPoint.y < scene.frame.height * -0.35) {
                // cannon dropped below base ground, return it to toolbar
                self.removeFromParent()
                self.spawned = !self.spawned
                self.position = CGPoint(x: Screen.screen!.minX - 100, y: 0)
                cannonButton.returnCannonToToolbar()
                self.snapping = false
                self.physicsBody!.isDynamic = false
            } else {
                self.position = CGPoint(x: self.position.x, y: self.position.y - 3)
            }
        }
    }
    
    func stopSnap(contact: SKPhysicsContact) {
        if(self.snapping && ((contact.bodyB.categoryBitMask == CollisionType.getGround() && contact.bodyA.categoryBitMask == CollisionType.getCannon()) || (contact.bodyB.categoryBitMask == CollisionType.getCannon() && contact.bodyA.categoryBitMask == CollisionType.getGround()))) {
            self.snapping = false
            self.physicsBody!.isDynamic = false
            self.finalSnap = true
        }
    }
    
    func snapFinal() {
        if(self.finalSnap) {
            self.finalSnap = false
            //self.position = CGPoint(x: self.position.x, y: self.position.y - 2.5)
        }
    }
    
    func moveWithBox() {
        if(!self.movedWithBox && Lever.leverCheck) {
            self.movedWithBox = !self.movedWithBox
            //self.position.y = self.position.y + 0.5
            self.physicsBody!.isDynamic = true
            self.physicsBody!.affectedByGravity = false
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
    
    func getSpawned() -> Bool {
        return self.spawned
    }
    
    func changeSpawned() {
        self.spawned = !self.spawned
    }
        
    func getCannonInUse() -> Bool {
        return self.cannonInUse
    }
    
    func changeCannonInUse() {
        self.cannonInUse = !self.cannonInUse
    }
    
    func getCannonFacing() -> String {
        return self.cannonFacing
    }
    
    func getNoCannonMove() -> Int {
        return self.noCannonMove
    }
    
    func incrementNoCannonMove() {
        self.noCannonMove += 1
    }
    
    func decrementNoCannonMove() {
        self.noCannonMove -= 1
    }
    
    func relocate(touchLocation: CGPoint, gameFinished: Bool) {
        if(!self.cannonInUse && !Lever.leverCheck && !gameFinished && self.noCannonMove == 0 && self.contains(touchLocation) && !Locker.getItemLock()) {
            Locker.changeItemLock()
            self.cannonInUse = !self.cannonInUse
            self.position = CGPoint(x: touchLocation.x, y: touchLocation.y)
        }
    }
    
    func drag(touchLocation: CGPoint) {
        if(self.cannonInUse) {
            self.position = CGPoint(x: touchLocation.x, y: touchLocation.y)
        }
    }
    
    func changeDirection(touchLocation: CGPoint, numberOfTouches: Int, gameFinished: Bool) {
        if(!gameFinished && numberOfTouches == 2 && self.noCannonMove == 0 && self.contains(touchLocation)) {
            if(self.cannonFacing == "right") {
                self.run(Animation.getCannonFaceLeft())
                self.cannonFacing = "left"
                self.setPhysics(img: "cannon1L.png")
            } else {
                self.run(Animation.getCannonFaceRight())
                self.cannonFacing = "right"
                self.setPhysics(img: "cannon1.png")
            }
        }
    }
    
    fileprivate func setPhysics(img: String) {
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: img), size: CGSize(width: self.size.width, height: self.size.height - 4))
        self.physicsBody!.isDynamic = false
        self.physicsBody!.usesPreciseCollisionDetection = false
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.allowsRotation = false
        self.physicsBody!.restitution = 0.0
        self.physicsBody!.categoryBitMask = CollisionType.getCannon()
        self.physicsBody!.contactTestBitMask = CollisionType.getGround()
        self.physicsBody!.collisionBitMask = CollisionType.getNoInteraction()
    }
}
