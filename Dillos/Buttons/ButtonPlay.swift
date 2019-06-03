// play button
import SpriteKit
class PlayButton: Button {
    
    fileprivate var level: String?
    fileprivate var posX: CGFloat?
    fileprivate var posY: CGFloat?
    fileprivate var view: SKView?
    fileprivate var playBP: SKTexture?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(level: Int, posX: CGFloat, posY: CGFloat, view: SKView) {
        self.level = "Level" + String(describing: level)
        self.posX = posX
        self.posY = posY
        self.view = view
        self.playBP = SKTexture(imageNamed: "playBP.png")
        let texture = SKTexture(imageNamed: "playB.png")
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
            Animation.changeMenuButtonsAnimation(texture: self.playBP!)
            self.run(Animation.getMenuButtonsAnimation())
        }
    }
    
    override func touchRelease() {
        if(self.changeBool) {
            Locker.changeButtonLock()
            self.changeBool = !self.changeBool
            let transition = SKTransition.reveal(with: .down, duration: 2.0)
            let SceneClass = NSClassFromString("Dillos.\(self.level!)") as? SKScene.Type
            self.level = self.level!.lowercased()
            let nextScene = SceneClass!.init(fileNamed: self.level!)
            nextScene!.scaleMode = .resizeFill
            
            let skView = self.view! as SKView
            skView.showsPhysics = false
            skView.ignoresSiblingOrder = true
            
            skView.presentScene(nextScene!, transition: transition)
        }
    }
}



