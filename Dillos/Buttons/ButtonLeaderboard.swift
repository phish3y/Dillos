// leaderboard button
import SpriteKit
class LeaderboardButton: Button {
    
    fileprivate var posX: CGFloat?
    fileprivate var posY: CGFloat?
    fileprivate var leaderboardB: SKTexture?
    fileprivate var leaderboardBP: SKTexture?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(posX: CGFloat, posY: CGFloat) {
        self.posX = posX
        self.posY = posY
        self.leaderboardB = SKTexture(imageNamed: "leaderboardB.png")
        self.leaderboardBP = SKTexture(imageNamed: "leaderboardBP.png")
        let texture = self.leaderboardB!
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
            Animation.changeMenuButtonsAnimation(texture: self.leaderboardBP!)
            self.run(Animation.getMenuButtonsAnimation())
        }
    }
    
    override func touchRelease() {
        if(self.changeBool) {
            Locker.changeButtonLock()
            self.changeBool = !self.changeBool
            Animation.changeMenuButtonsAnimation(texture: self.leaderboardB!)
            self.run(Animation.getMenuButtonsAnimation())
        }
    }
}




