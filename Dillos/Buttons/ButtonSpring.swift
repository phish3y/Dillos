/*spring button*/
import SpriteKit

class SpringButton: Button {
    
    fileprivate var numberOfSprings: Int?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(numberOfSprings: Int) {
        self.numberOfSprings = numberOfSprings
        var texture: SKTexture?
        if (self.numberOfSprings == 0) {
            texture = SKTexture(imageNamed: "springB0.png")
        } else if (self.numberOfSprings == 1) {
            texture = SKTexture(imageNamed: "springB1.png")
        } else if (self.numberOfSprings == 2) {
            texture = SKTexture(imageNamed: "springB2.png")
        }
        super.init(texture: texture!, color: UIColor(), size: texture!.size())
        self.initSize()
        self.initPosition()
    }
    
    internal override func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * -0.4607, y: Screen.screen!.height * -0.4285)
        self.zPosition = 0.21 
    }
    
    func getNumberOfSprings() -> Int {
        return self.numberOfSprings!
    }
    
    override func touchBegin() {
        Locker.changeButtonLock()
        Animation.changeSpringButtonPressedAnimation(numberOfSprings: self.numberOfSprings!)
        if(self.numberOfSprings! > 0) {
            Locker.changeItemLock()
            self.numberOfSprings! -= 1
        }
        self.changeBool = true
        self.run(Animation.getSpringButtonPressedAnimation())
    }
    
    override func touchRelease(){
        if(self.changeBool) {
            Locker.changeButtonLock()
            self.changeBool = false
            Animation.changeSpringButtonAnimation(numberOfSprings: self.numberOfSprings!)
            self.run(Animation.getSpringButtonAnimation())
            
        }
    }
    
    func returnSpringToToolbar() {
        self.numberOfSprings! += 1
        Animation.changeSpringButtonAnimation(numberOfSprings: self.numberOfSprings!)
        self.run(Animation.getSpringButtonAnimation())
    }
}
