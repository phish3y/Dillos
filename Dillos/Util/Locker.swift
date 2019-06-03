// lock flags
class Locker {
    
    // so you can't pick up more than one item at once
    fileprivate static var itemLock = false
    // only used on menu
    fileprivate static var buttonLock = false
    // lock certain buttons if prompt is open
    fileprivate static var promptLock = false

    static func resetItemLock() {
        itemLock = false
    }
    static func changeItemLock() {
        itemLock = !itemLock
    }
    
    static func getItemLock() -> Bool {
        return itemLock
    }
    
    static func resetButtonLock() {
        buttonLock = false
    }
    
    static func changeButtonLock() {
        buttonLock = !buttonLock
    }
    
    static func getButtonLock() -> Bool {
        return buttonLock
    }
    
    static func changePromptLock() {
        promptLock = !promptLock
    }
    
    static func getPromptLock() -> Bool {
        return promptLock
    }
    
    static func resetPromptLock() {
        promptLock = false
    }
}
