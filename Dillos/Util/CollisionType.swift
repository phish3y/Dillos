/*CollisionTtype class*/
class CollisionType {
    
    fileprivate static let noInteraction = UInt32(0)
    fileprivate static let dillo = UInt32(1)
    fileprivate static let ground = UInt32(2)
    fileprivate static let death = UInt32(3)
    fileprivate static let spring = UInt32(4)
    fileprivate static let cannon = UInt32(8)
    
    static func getNoInteraction() -> UInt32 {
        return self.noInteraction
    }
    static func getDillo() -> UInt32 {
        return self.dillo
    }
    static func getDeath() -> UInt32 {
        return self.death
    }
    static func getSpring() -> UInt32 {
        return self.spring
    }
    static func getGround() -> UInt32 {
        return self.ground
    }
    static func getCannon() -> UInt32 {
        return self.cannon
    }
}
