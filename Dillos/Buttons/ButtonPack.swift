// button for all packs
import SpriteKit
class PackButton: Button {
    
    fileprivate var pack: String?
    fileprivate var posX: CGFloat?
    fileprivate var posY: CGFloat?
    fileprivate var packB: SKTexture?
    fileprivate var packBP: SKTexture?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(img: String, pack: String, posX: CGFloat, posY: CGFloat) {
        self.pack = pack
        self.posX = posX
        self.posY = posY
        self.packB = SKTexture(imageNamed: self.pack! + "B.png")
        self.packBP = SKTexture(imageNamed: self.pack! + "BP.png")
        let texture = SKTexture(imageNamed: img)
        super.init(texture: texture, color: UIColor(), size: texture.size())
        self.initPosition()
        self.initSize()
    }
    
    internal override func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * self.posX!, y: Screen.screen!.height * self.posY!)
        self.zPosition = 0.4
    }
    
    override func touchBegin() {
        if(!self.changeBool) {
            Locker.changeButtonLock()
            self.changeBool = !self.changeBool
            Animation.changeMenuButtonsAnimation(texture: self.packBP!)
            self.run(Animation.getMenuButtonsAnimation())
        }
    }
    
    override func touchRelease() {
        if(self.changeBool) {
            Locker.changeButtonLock()
            self.changeBool = !self.changeBool
            Animation.changeMenuButtonsAnimation(texture: self.packB!)
            self.run(Animation.getMenuButtonsAnimation())
        }
    }
}


