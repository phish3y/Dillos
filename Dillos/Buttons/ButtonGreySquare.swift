// button to grey out other buttons
import SpriteKit
class GreySquareButton: Button {
    
    fileprivate var posX: CGFloat?
    fileprivate var posY: CGFloat?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(posX: CGFloat, posY: CGFloat) {
        self.posX = posX
        self.posY = posY
        let texture = SKTexture(imageNamed: "greyButtonSquare.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initPosition()
        self.initSize()
    }
    
    internal override func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * self.posX!, y: Screen.screen!.height * self.posY!)
        self.zPosition = 0.8
    }
}

