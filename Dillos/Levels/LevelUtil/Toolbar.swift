/*toolbar*/
import SpriteKit
class Toolbar: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        let texture = SKTexture(imageNamed: "toolbar.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initSize()
        self.initPosition()
    }
    
    fileprivate func initSize() {
        self.size = CGSize(width: (self.size.width/2208) * Screen.screen!.width, height: (self.size.height/1242) * Screen.screen!.height)
    }
    
    fileprivate func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * 0.0, y: Screen.screen!.minY + (self.frame.height / 2))
        self.zPosition = 0.091
    }
}

