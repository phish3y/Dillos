/*level finish clss*/
import SpriteKit
class LevelFinish: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        let texture = SKTexture( imageNamed: "lvlFinish.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initSize()
        self.initPosition()
    }
    
    fileprivate func initSize() {
        self.size = CGSize(width: (self.size.width/2208) * Screen.screen!.width + 2, height: (self.size.height/1242) * Screen.screen!.height)
    }
    
    fileprivate func initPosition(){
        self.position = CGPoint(x: Screen.screen!.midX, y: Screen.screen!.midX - (Screen.screen!.height - self.size.height) / 2)
        self.zPosition = 2.2
    }
}
