/*yes button*/
import SpriteKit
class OkayButton: Button {
    
    fileprivate var okayBP: SKTexture?
    fileprivate var okayB: SKTexture?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        self.okayB = SKTexture(imageNamed: "okayB.png")
        self.okayBP = SKTexture(imageNamed: "okayBP.png")
        let texture = self.okayB!
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initSize()
        self.initPosition()
    }
    
    internal override func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * 0.0, y: Screen.screen!.height * 0.18)
        self.zPosition = 6.1
    }
    
    override func touchBegin() {
        Locker.changeButtonLock()
        self.changeBool = !self.changeBool
        Animation.changeOkayButtonAnimation(texture: self.okayBP!)
        self.run(Animation.getOkayButtonAnimation())
    }
    
    override func touchRelease() {
        if(self.changeBool) {
            Locker.changeButtonLock()
            self.changeBool = !self.changeBool
            Animation.changeOkayButtonAnimation(texture: self.okayB!)
            self.run(Animation.getOkayButtonAnimation())
        }
    }
}

