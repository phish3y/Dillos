/*finish button*/
import SpriteKit
class FinishButton: Button {
    
    fileprivate var finishBP: SKTexture?
    fileprivate var finishB: SKTexture?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        self.finishB = SKTexture(imageNamed: "finishB.png")
        self.finishBP = SKTexture(imageNamed: "finishBP.png")
        let texture = self.finishB!
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initPosition()
        self.initSize()
    }
    
    internal override func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * 0.3185, y: Screen.screen!.height * -0.428)
        self.zPosition = 0.21
    }
    
    override func touchBegin() {
        if(self.changeInt == 0) {
            Locker.changePromptLock()
            Locker.changeButtonLock()
            self.changeInt += 1
            Animation.changeFinishButtonAnimation(texture: self.finishBP!)
            self.run(Animation.getFinishButtonAnimation())
        }
    }
    
    override func touchRelease() {
        Locker.changeButtonLock()
        self.changeInt += 1
        Animation.changeFinishButtonAnimation(texture: self.finishB!)
        self.run(Animation.getFinishButtonAnimation())
    }
}


