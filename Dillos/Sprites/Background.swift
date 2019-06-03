/*background clss*/
import SpriteKit
class Background: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundPic: String) {
        let texture = SKTexture(imageNamed: backgroundPic)
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initPosition()
        self.initSize()
    }
    
    fileprivate func initPosition(){
        self.position = CGPoint(x: Screen.screen!.width * 0, y: Screen.screen!.height * 0)
        self.zPosition = 0.0
    }
    
    fileprivate func initSize() {
        self.size = CGSize(width: ((self.size.width/2208) * Screen.screen!.width) + 4, height: (self.size.height/1242) * Screen.screen!.height)
    }
}
