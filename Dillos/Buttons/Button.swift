import SpriteKit
class Button: SKSpriteNode {
    
    internal var changeBool = false
    internal var changeInt = 0
    
    internal func initSize() {
        self.size = CGSize(width: (self.size.width/2208) * Screen.screen!.width, height: (self.size.height/1242) * Screen.screen!.height)
    }
    internal func initPosition() {}
    
    func touchBegin() {}
    func touchRelease() {}
    
    func getChangeInt() -> Int {
        return self.changeInt
    }
    
    func getChangeBool() -> Bool {
        return self.changeBool
    }
    
    func resetChangeInt() {
        self.changeInt = 0
    }
}
