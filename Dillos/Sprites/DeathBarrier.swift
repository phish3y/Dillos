import SpriteKit
class DeathBarrier: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(sizeX: CGFloat, posX: CGFloat, posY: CGFloat) {
        super.init(texture: nil, color: UIColor(), size: CGSize(width: sizeX, height: 1.0))
        self.initPosition(posX: posX, posY: posY)
        self.initPhysics()
    }
    
    fileprivate func initPosition(posX: CGFloat, posY: CGFloat) {
        self.position = CGPoint(x: Screen.screen!.width * posX, y: Screen.screen!.height * posY)
        self.zPosition = -5.0
    }
            
    fileprivate func initPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody!.isDynamic = false
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.allowsRotation = false
        self.physicsBody!.friction = 0.0
        self.physicsBody!.restitution = 0.0
        self.physicsBody!.categoryBitMask = CollisionType.getDeath()
        self.physicsBody!.contactTestBitMask = CollisionType.getDillo()
    }
}
