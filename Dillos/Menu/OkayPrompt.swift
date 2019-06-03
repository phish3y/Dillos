// okay promprt
import SpriteKit
class OkayPrompt: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        let texture = SKTexture(imageNamed: "okayPrompt.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initPosition()
        self.initSize()
    }
    
    fileprivate func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * 0.0, y: Screen.screen!.height * 0.25)
        self.zPosition = 6.0
    }
    
    fileprivate func initSize() {
        self.size = CGSize(width: (self.size.width/2208) * Screen.screen!.width, height: (self.size.height/1242) * Screen.screen!.height)
    }
}

