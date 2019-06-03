/*menubutton button in prompt to return to menu screen*/
import SpriteKit
class MenuButtonLevelFinish: Button {
    
    fileprivate var menuBAP: SKTexture?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        self.menuBAP = SKTexture(imageNamed: "menuBAP.png")
        let texture = SKTexture(imageNamed: "menuBA.png")
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initSize()
        self.initPosition()
    }
    
    internal override func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * 0.001, y: Screen.screen!.height * -0.374)
        self.zPosition = 2.3
    }
    
    override func touchBegin() {
        Locker.changeButtonLock()
        self.changeInt += 1
        Animation.changeMenuButtonAnimation(texture: self.menuBAP!)
        self.run(Animation.getMenuButtonAnimation())
    }
}
