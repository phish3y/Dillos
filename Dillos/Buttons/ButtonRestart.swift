/*restart button*/
import SpriteKit
class RestartButton: Button {
    
    fileprivate var restartBP: SKTexture?
    fileprivate var restartB: SKTexture?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        self.restartB = SKTexture(imageNamed: "restartB.png")
        self.restartBP = SKTexture(imageNamed: "restartBP.png")
        let texture = self.restartB!
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initSize()
        self.initPosition()
    }
    
    internal override func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * 0.221, y: Screen.screen!.height * -0.428)
        self.zPosition = 0.21
    }
    
    override func touchBegin() {
        Locker.changeButtonLock()
        Locker.changePromptLock()
        self.changeInt += 1
        Animation.addRestartButtonAnimation(texture: self.restartBP!)
        self.run(Animation.getRestartButtonAnimation())
    }
    
    override func touchRelease() {
        Locker.changeButtonLock()
        self.changeInt += 1
        Animation.addRestartButtonAnimation(texture: self.restartB!)
        self.run(Animation.getRestartButtonAnimation())
    }
}
