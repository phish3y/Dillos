/*bridge clss*/
import SpriteKit
class Bridge: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(posX: CGFloat, posY: CGFloat) {
        let texture = SKTexture(imageNamed: "bridge.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initPosition(posX: posX, posY: posY)
        self.initSize()
        self.initPhysics()
    }
    
    fileprivate func initPosition(posX: CGFloat, posY: CGFloat) {
        self.position = CGPoint(x: Screen.screen!.width * posX, y: Screen.screen!.height * posY)
        self.zPosition = 0.09
    }
    
    fileprivate func initSize() {
        self.size = CGSize(width: (self.size.width/2208) * Screen.screen!.width, height: (self.size.height/1242) * Screen.screen!.height)
    }
    
    fileprivate func initPhysics() {
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "bridge.png"), size: self.size)
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.isDynamic = false
        self.physicsBody!.friction = 0.0
        self.physicsBody!.categoryBitMask = CollisionType.getGround()
        self.physicsBody!.allowsRotation = false
        self.physicsBody!.restitution = 0.0
    }
}
