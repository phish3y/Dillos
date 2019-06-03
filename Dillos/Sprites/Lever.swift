/*class for switches*/
import SpriteKit
class Lever: SKSpriteNode {
    
    var leverPressed = 0
    static var leverCheck = false
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(posX: CGFloat, posY: CGFloat) {
        let texture = SKTexture(imageNamed: "lever1.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initSize()
        self.initPosition(posX: posX, posY: posY)
    }
    
    fileprivate func initSize() {
        self.size = CGSize(width: (self.size.width/2208) * Screen.screen!.width, height: (self.size.height/1242) * Screen.screen!.height)
    }
    
    fileprivate func initPosition(posX: CGFloat, posY: CGFloat) {
        self.zPosition = 0.240
        self.position = CGPoint(x: Screen.screen!.width * posX, y: Screen.screen!.height * posY)
    }
    
    func pullLever(touchLocation: CGPoint) {
        if(self.leverPressed == 1 && self.contains(touchLocation)) {
            Lever.leverCheck = true
            self.run(Animation.getLeverAnimation(), completion: {
                self.leverPressed += 1
            })
        }
    }
}
