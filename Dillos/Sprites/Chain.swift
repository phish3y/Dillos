/*chain clss*/
import SpriteKit
class Chain: SKSpriteNode {
    
    var posX: CGFloat?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(posX: CGFloat, box: Box?, bridge: Bridge?) {
        self.posX = posX
        let texture = SKTexture(imageNamed: "chain.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initSize()
        self.initPosition(posX: posX, box: box, bridge: bridge)
    }
    
    fileprivate func initSize() {
        self.size = CGSize(width: (self.size.width/2208) * Screen.screen!.width, height: (self.size.height/1242) * Screen.screen!.height)
    }
    
    fileprivate func initPosition(posX: CGFloat, box: Box?, bridge: Bridge?) {
        if(box != nil) {
            self.position = CGPoint(x: Screen.screen!.width * posX, y: (box!.frame.maxY - 5) + (self.frame.height / 2.0))
        } else {
            self.position = CGPoint(x: Screen.screen!.width * posX, y: (bridge!.frame.maxY - 5) + (self.frame.height / 2.0))
        }
        self.zPosition = 0.075
    }
}
