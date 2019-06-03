/*retry button*/
import SpriteKit
class RetryButton: Button {
    
    fileprivate var retryBAP: SKTexture?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        self.retryBAP = SKTexture(imageNamed: "retryBAP.png")
        let texture = SKTexture(imageNamed: "retryBA.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initSize()
        self.initPosition()
    }
    
    internal override func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * -0.4048, y: Screen.screen!.height * -0.374)
        self.zPosition = 2.3
    }

    override func touchBegin() {
        Locker.changeButtonLock()
        self.changeInt += 1
        Animation.addRetryButtonAnimation(texture: self.retryBAP!)
        self.run(Animation.getRetryButtonAnimation())
    }
}
