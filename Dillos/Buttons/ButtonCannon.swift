/*cannon button*/
import SpriteKit

class CannonButton: Button {
    
    fileprivate var numberOfCannons: Int?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(numberOfCannons: Int) {
        self.numberOfCannons = numberOfCannons
        var texture: SKTexture?
        if (self.numberOfCannons == 0) {
            texture = SKTexture(imageNamed: "cannonB0.png")
        }else if (self.numberOfCannons == 1) {
            texture = SKTexture(imageNamed: "cannonB1.png")
        }else if (self.numberOfCannons == 2) {
            texture = SKTexture(imageNamed: "cannonB2.png")
        }
        super.init(texture: texture!, color: UIColor(), size: texture!.size())
        self.initSize()
        self.initPosition()
    }
    
    internal override func initPosition() {
        self.position = CGPoint(x: Screen.screen!.width * -0.3807, y: Screen.screen!.height * -0.4285)
        self.zPosition = 0.21
    }
    
    func getNumberOfCannons() -> Int {
        return self.numberOfCannons!
    }
    
    override func touchBegin() {
        Locker.changeButtonLock()
        if(self.numberOfCannons! > 0) {
            Locker.changeItemLock()
            Animation.changeCannonButtonPressedAnimation(numberOfCannons: self.numberOfCannons!)
            self.numberOfCannons! -= 1
        } else if(self.numberOfCannons! == 0) {
            Animation.changeCannonButtonPressedAnimation(numberOfCannons: self.numberOfCannons!)
        }
        self.changeBool = true
        self.run(Animation.getCannonButtonPressedAnimation())
    }
    
    override func touchRelease(){
        if(self.changeBool) {
            Locker.changeButtonLock()
            self.changeBool = false
            Animation.changeCannonButtonAnimation(numberOfCannons: self.numberOfCannons!)
            self.run(Animation.getCannonButtonAnimation())
            
        }
    }
    
    func returnCannonToToolbar() {
        self.numberOfCannons! += 1
        Animation.changeCannonButtonAnimation(numberOfCannons: self.numberOfCannons!)
        self.run(Animation.getCannonButtonAnimation())
        
    }
}
