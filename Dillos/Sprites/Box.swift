/*box clss*/
import SpriteKit
class Box: SKSpriteNode {
    
    fileprivate var movingUp = false
    fileprivate var movingDown = false
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(posX: CGFloat, posY: CGFloat) {
        let texture = SKTexture(imageNamed: "box.png")
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
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "box.png"), size: self.size)
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.isDynamic = false
        self.physicsBody!.friction = 0.0
        self.physicsBody!.categoryBitMask = CollisionType.getGround()
        self.physicsBody!.allowsRotation = false
        self.physicsBody!.restitution = 0.0
    }
    
    func startMove(up: Bool, lever: Lever, chain: Chain) {
        if(!self.movingUp && !self.movingDown && lever.leverPressed == 2) {
            if(up) {
                self.movingUp = !self.movingUp
            } else {
                self.movingDown = !self.movingDown
            }
        }
    }
    
    func continueMove(up: Bool) {
        if(self.movingUp || self.movingDown) {
            if(up && self.movingUp) {
                self.position.y = self.position.y + 0.6
            } else if(!up && self.movingDown) {
                self.position.y = self.position.y - 0.6
            }
        }
    }
    
    func stopMove(posY: CGFloat, lever: Lever) {
        if((self.movingUp || self.movingDown) && round(self.frame.maxY) == round(Screen.screen!.height * posY) && lever.leverPressed > 0) {
            self.movingUp = false
            self.movingDown = false
            lever.leverPressed += 1
            Lever.leverCheck = false
        }
    }
}