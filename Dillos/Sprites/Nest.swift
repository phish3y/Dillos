/*nest clss*/
import SpriteKit
class Nest: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(posX: CGFloat, posY: CGFloat){
        let texture = SKTexture( imageNamed: "nest0.png" )
        super.init(texture: texture, color: UIColor(), size: texture.size())
        initSize()
        initPosition(posX: posX, posY: posY)
    }
    
    fileprivate func initSize() {
        self.size = CGSize(width: (self.size.width/2208) * Screen.screen!.width, height: (self.size.height/1242) * Screen.screen!.height)
    }
    
    fileprivate func initPosition(posX: CGFloat, posY: CGFloat) {
        self.position = CGPoint(x: Screen.screen!.width * posX, y: Screen.screen!.height * posY)
        self.zPosition = 0.24
    }
}
