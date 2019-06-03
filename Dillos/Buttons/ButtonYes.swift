/*yes button*/
import SpriteKit
class YesButton: Button {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        let texture = SKTexture(imageNamed: "yesB.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initSize()
        self.initPosition()
    }

    internal override func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * -0.06, y: Screen.screen!.height * -0.072)
        self.zPosition = 2.1
    }
    
    override func touchBegin() {
        Locker.changeButtonLock()
        self.changeInt += 1
        self.run(Animation.getYesButtonAnimation())
    }
}
