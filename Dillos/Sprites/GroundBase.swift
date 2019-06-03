/*ground class*/
import SpriteKit
class GroundBase: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(img: String) {
        let texture = SKTexture(imageNamed: img)
        super.init(texture: texture, color: UIColor(), size: texture.size())
        initSize()
        initPosition()
        initPhysics(img: img)
    }
    
    fileprivate func initSize() {
        self.size = CGSize(width: (self.size.width/2208) * Screen.screen!.width, height: (self.size.height/1242) * Screen.screen!.height)
    }
    
    fileprivate func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * 0, y: Screen.screen!.minY + (self.size.height/2.0))
        self.zPosition = 0.08
    }
    
    fileprivate func initPhysics(img: String) {
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: img), size: self.size)
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.isDynamic = false
        self.physicsBody!.allowsRotation = false
        self.physicsBody!.categoryBitMask = CollisionType.getGround()
        self.physicsBody!.restitution = 0.0
        self.physicsBody!.friction = 0.0
    }
}
