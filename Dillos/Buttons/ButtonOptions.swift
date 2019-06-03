// options button
import SpriteKit
class OptionsButton: Button {
    
    fileprivate var posX: CGFloat?
    fileprivate var posY: CGFloat?
    fileprivate var optionsBP: SKTexture?
    fileprivate var optionsB: SKTexture?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(posX: CGFloat, posY: CGFloat) {
        self.posX = posX
        self.posY = posY
        self.optionsB = SKTexture(imageNamed: "optionsB.png")
        let texture = self.optionsB!
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initPosition()
        self.initSize()
    }
    
    internal override func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * self.posX!, y: Screen.screen!.height * self.posY!)
        self.zPosition = 0.2
    }
    
    override func touchBegin() {
        if(!self.changeBool) {
            Locker.changeButtonLock()
            self.changeBool = !self.changeBool
            Animation.changeMenuButtonsAnimation(texture: self.optionsBP!)
            self.run(Animation.getMenuButtonsAnimation())
        }
    }
    
    override func touchRelease() {
        if(self.changeBool) {
            Locker.changeButtonLock()
            self.changeBool = !self.changeBool
            Animation.changeMenuButtonsAnimation(texture: self.optionsB!)
            self.run(Animation.getMenuButtonsAnimation())
        }
    }
}



