/*next button*/
import SpriteKit
class NextButton: Button {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        let texture = SKTexture(imageNamed: "nextBA.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initSize()
        self.initPosition()
    }
    
    internal override func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * 0.4048, y: Screen.screen!.height * -0.374)
        self.zPosition = 2.3
    }
    
    override func touchBegin() {
        self.changeInt += 1
        Locker.changeButtonLock()
        self.run(Animation.getNextButtonAnimation())
    }
}
