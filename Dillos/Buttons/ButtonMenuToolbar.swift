/*menubutton button in level to return to menu screen*/
import SpriteKit
class MenuButtonToolbar: Button {
    
    fileprivate var menuBP: SKTexture?
    fileprivate var menuB: SKTexture?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        self.menuB = SKTexture(imageNamed: "menuB.png")
        self.menuBP = SKTexture(imageNamed: "menuBP.png")
        let texture = self.menuB!
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initSize()
        self.initPosition()
    }
    
    internal override func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * 0.435, y: Screen.screen!.height * -0.428)
        self.zPosition = 0.21
    }

    override func touchBegin() {
        Locker.changePromptLock()
        Locker.changeButtonLock()
        self.changeInt += 1
        Animation.changeMenuButtonAnimation(texture: self.menuBP!)
        self.run(Animation.getMenuButtonAnimation())
    }
    
    override func touchRelease() {
        Locker.changeButtonLock()
        self.changeInt += 1
        Animation.changeMenuButtonAnimation(texture: self.menuB!)
        self.run(Animation.getMenuButtonAnimation())
    }
}
