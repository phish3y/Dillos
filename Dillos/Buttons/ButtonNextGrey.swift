/*next button*/
import SpriteKit
class NextButtonGrey: Button {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        let texture = SKTexture(imageNamed: "greyNextB.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initSize()
        self.initPosition()
    }
    
    internal override func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * 0.405, y: Screen.screen!.height * -0.374)
        self.zPosition = 2.31
    }
}

