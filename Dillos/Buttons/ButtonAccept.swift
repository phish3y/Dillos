// accept username button
import SpriteKit
class AcceptButton: Button {
    
    fileprivate var acceptBP: SKTexture?
    fileprivate var acceptB: SKTexture?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        self.acceptB = SKTexture(imageNamed: "acceptB.png")
        self.acceptBP = SKTexture(imageNamed: "acceptBP.png")
        let texture = self.acceptB!
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initPosition()
        self.initSize()
    }
    
    internal override func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * 0.0, y: Screen.screen!.height * 0.13)
        self.zPosition = 5.1
    }
    
    override func touchBegin() {
        if(!self.changeBool) {
            Locker.changeButtonLock()
            self.changeBool = !self.changeBool
            Animation.changeMenuButtonsAnimation(texture: self.acceptBP!)
            self.run(Animation.getMenuButtonsAnimation())
        }
    }
    
    override func touchRelease() {
        Locker.changeButtonLock()
        self.changeBool = !self.changeBool
        Animation.changeMenuButtonsAnimation(texture: self.acceptB!)
        self.run(Animation.getMenuButtonsAnimation())
    }
}



