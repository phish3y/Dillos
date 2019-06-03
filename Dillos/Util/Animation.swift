import SpriteKit
class Animation {
    
    fileprivate static var forwardAnimation: SKAction?
    fileprivate static var backwardAnimation: SKAction?
    fileprivate static var openStartAnimation: SKAction?
    fileprivate static var openLeftAnimation: SKAction?
    fileprivate static var springAnimation: SKAction?
    fileprivate static var nestAnimation: SKAction?
    fileprivate static var cannonFireLeftAnimation: SKAction?
    fileprivate static var cannonFireRightAnimation: SKAction?
    fileprivate static var dilloEnterBallRight: SKAction?
    fileprivate static var dilloEnterBallLeft: SKAction?
    fileprivate static var springButtonAnimation: SKAction?
    fileprivate static var springButtonPressedAnimation: SKAction?
    fileprivate static var cannonButtonAnimation: SKAction?
    fileprivate static var cannonButtonPressedAnimation: SKAction?
    fileprivate static var cannonFinishLeft: SKAction?
    fileprivate static var cannonFinishRight: SKAction?
    fileprivate static var restartButtonAnimation: SKAction?
    fileprivate static var retryButtonAnimation: SKAction?
    fileprivate static var nextButtonAnimation: SKAction?
    fileprivate static var noButtonAnimation: SKAction?
    fileprivate static var yesButtonAnimation: SKAction?
    fileprivate static var okayButtonAnimation: SKAction?
    fileprivate static var cannonFaceLeft: SKAction?
    fileprivate static var cannonFaceRight: SKAction?
    fileprivate static var menuButtonsAnimation: SKAction?
    fileprivate static var menuButtonAnimation: SKAction?
    fileprivate static var finishButtonAnimation: SKAction?
    fileprivate static var leverAnimation: SKAction?
    fileprivate static var leverFinishAnimation: SKAction?
    fileprivate static var loadingPromptAnimation: SKAction?
    
    fileprivate static var loadingPrompt1: SKTexture?
    fileprivate static var loadingPrompt2: SKTexture?
    fileprivate static var loadingPrompt3: SKTexture?
    fileprivate static var loadingPrompt4: SKTexture?
    fileprivate static var loadingPrompt5: SKTexture?
    fileprivate static var nextBAP: SKTexture?
    fileprivate static var lever3: SKTexture?
    fileprivate static var lever4: SKTexture?
    fileprivate static var lever5: SKTexture?
    fileprivate static var lever6: SKTexture?
    fileprivate static var lever7: SKTexture?
    fileprivate static var lever8: SKTexture?
    fileprivate static var lever9: SKTexture?
    fileprivate static var drf5: SKTexture?
    fileprivate static var drf6: SKTexture?
    fileprivate static var drf7: SKTexture?
    fileprivate static var drf8: SKTexture?
    fileprivate static var drf9: SKTexture?
    fileprivate static var drf10: SKTexture?
    fileprivate static var drf11: SKTexture?
    fileprivate static var drb5: SKTexture?
    fileprivate static var drb6: SKTexture?
    fileprivate static var drb7: SKTexture?
    fileprivate static var drb8: SKTexture?
    fileprivate static var drb9: SKTexture?
    fileprivate static var drb10: SKTexture?
    fileprivate static var drb11: SKTexture?
    fileprivate static var dwf1: SKTexture?
    fileprivate static var dwf2: SKTexture?
    fileprivate static var dwf3: SKTexture?
    fileprivate static var dwf4: SKTexture?
    fileprivate static var dwf5: SKTexture?
    fileprivate static var dwf6: SKTexture?
    fileprivate static var dwb1: SKTexture?
    fileprivate static var dwb2: SKTexture?
    fileprivate static var dwb3: SKTexture?
    fileprivate static var dwb4: SKTexture?
    fileprivate static var dwb5: SKTexture?
    fileprivate static var dwb6: SKTexture?
    fileprivate static var cannon1L: SKTexture?
    fileprivate static var cannon2L: SKTexture?
    fileprivate static var cannon3L: SKTexture?
    fileprivate static var cannon4L: SKTexture?
    fileprivate static var cannon5L: SKTexture?
    fileprivate static var cannon6L: SKTexture?
    fileprivate static var cannon7L: SKTexture?
    fileprivate static var cannon8L: SKTexture?
    fileprivate static var cannon9L: SKTexture?
    fileprivate static var cannon10L: SKTexture?
    fileprivate static var cannon11L: SKTexture?
    fileprivate static var cannon12L: SKTexture?
    fileprivate static var cannon1: SKTexture?
    fileprivate static var cannon2: SKTexture?
    fileprivate static var cannon3: SKTexture?
    fileprivate static var cannon4: SKTexture?
    fileprivate static var cannon5: SKTexture?
    fileprivate static var cannon6: SKTexture?
    fileprivate static var cannon7: SKTexture?
    fileprivate static var cannon8: SKTexture?
    fileprivate static var cannon9: SKTexture?
    fileprivate static var cannon10: SKTexture?
    fileprivate static var cannon11: SKTexture?
    fileprivate static var cannon12: SKTexture?
    fileprivate static var springB2: SKTexture?
    fileprivate static var springB1: SKTexture?
    fileprivate static var springB0: SKTexture?
    fileprivate static var springB2P: SKTexture?
    fileprivate static var springB1P: SKTexture?
    fileprivate static var springB0P: SKTexture?
    fileprivate static var cannonB2: SKTexture?
    fileprivate static var cannonB1: SKTexture?
    fileprivate static var cannonB0: SKTexture?
    fileprivate static var cannonB2P: SKTexture?
    fileprivate static var cannonB1P: SKTexture?
    fileprivate static var cannonB0P: SKTexture?
    fileprivate static var noB: SKTexture?
    fileprivate static var noBP: SKTexture?
    fileprivate static var yesBP: SKTexture?
    fileprivate static var spring1: SKTexture?
    fileprivate static var spring2: SKTexture?
    fileprivate static var spring3: SKTexture?
    fileprivate static var spring4: SKTexture?

    static func loadImages() {
        loadingPrompt1 = SKTexture(imageNamed: "loadingPrompt1.png")
        loadingPrompt2 = SKTexture(imageNamed: "loadingPrompt2.png")
        loadingPrompt3 = SKTexture(imageNamed: "loadingPrompt3.png")
        loadingPrompt4 = SKTexture(imageNamed: "loadingPrompt4.png")
        loadingPrompt5 = SKTexture(imageNamed: "loadingPrompt5.png")
        nextBAP = SKTexture(imageNamed: "nextBAP.png")
        lever3 = SKTexture(imageNamed: "lever3.png")
        lever4 = SKTexture(imageNamed: "lever4.png")
        lever5 = SKTexture(imageNamed: "lever5.png")
        lever6 = SKTexture(imageNamed: "lever6.png")
        lever7 = SKTexture(imageNamed: "lever7.png")
        lever8 = SKTexture(imageNamed: "lever8.png")
        lever9 = SKTexture(imageNamed: "lever9.png")
        drf5 = SKTexture(imageNamed: "drf5.png")
        drf6 = SKTexture(imageNamed: "drf6.png")
        drf7 = SKTexture(imageNamed: "drf7.png")
        drf8 = SKTexture(imageNamed: "drf8.png")
        drf9 = SKTexture(imageNamed: "drf9.png")
        drf10 = SKTexture(imageNamed: "drf10.png")
        drf11 = SKTexture(imageNamed: "drf11.png")
        drb5 = SKTexture(imageNamed: "drb5.png")
        drb6 = SKTexture(imageNamed: "drb6.png")
        drb7 = SKTexture(imageNamed: "drb7.png")
        drb8 = SKTexture(imageNamed: "drb8.png")
        drb9 = SKTexture(imageNamed: "drb9.png")
        drb10 = SKTexture(imageNamed: "drb10.png")
        drb11 = SKTexture(imageNamed: "drb11.png")
        dwf1 = SKTexture(imageNamed: "dwf1.png")
        dwf2 = SKTexture(imageNamed: "dwf2.png")
        dwf3 = SKTexture(imageNamed: "dwf3.png")
        dwf4 = SKTexture(imageNamed: "dwf4.png")
        dwf5 = SKTexture(imageNamed: "dwf5.png")
        dwf6 = SKTexture(imageNamed: "dwf6.png")
        dwb1 = SKTexture(imageNamed: "dwb1.png")
        dwb2 = SKTexture(imageNamed: "dwb2.png")
        dwb3 = SKTexture(imageNamed: "dwb3.png")
        dwb4 = SKTexture(imageNamed: "dwb4.png")
        dwb5 = SKTexture(imageNamed: "dwb5.png")
        dwb6 = SKTexture(imageNamed: "dwb6.png")
        cannon1L = SKTexture(imageNamed: "cannon1L.png")
        cannon2L = SKTexture(imageNamed: "cannon2L.png")
        cannon3L = SKTexture(imageNamed: "cannon3L.png")
        cannon4L = SKTexture(imageNamed: "cannon4L.png")
        cannon5L = SKTexture(imageNamed: "cannon5L.png")
        cannon6L = SKTexture(imageNamed: "cannon6L.png")
        cannon7L = SKTexture(imageNamed: "cannon7L.png")
        cannon8L = SKTexture(imageNamed: "cannon8L.png")
        cannon9L = SKTexture(imageNamed: "cannon9L.png")
        cannon10L = SKTexture(imageNamed: "cannon10L.png")
        cannon11L = SKTexture(imageNamed: "cannon11L.png")
        cannon12L = SKTexture(imageNamed: "cannon12L.png")
        cannon1 = SKTexture(imageNamed: "cannon1.png")
        cannon2 = SKTexture(imageNamed: "cannon2.png")
        cannon3 = SKTexture(imageNamed: "cannon3.png")
        cannon4 = SKTexture(imageNamed: "cannon4.png")
        cannon5 = SKTexture(imageNamed: "cannon5.png")
        cannon6 = SKTexture(imageNamed: "cannon6.png")
        cannon7 = SKTexture(imageNamed: "cannon7.png")
        cannon8 = SKTexture(imageNamed: "cannon8.png")
        cannon9 = SKTexture(imageNamed: "cannon9.png")
        cannon10 = SKTexture(imageNamed: "cannon10.png")
        cannon11 = SKTexture(imageNamed: "cannon11.png")
        cannon12 = SKTexture(imageNamed: "cannon12.png")
        springB2 = SKTexture(imageNamed: "springB2")
        springB1 = SKTexture(imageNamed: "springB1")
        springB0 = SKTexture(imageNamed: "springB0")
        springB2P = SKTexture(imageNamed: "springB2P")
        springB1P = SKTexture(imageNamed: "springB1P")
        springB0P = SKTexture(imageNamed: "springB0P")
        cannonB2 = SKTexture(imageNamed: "cannonB2")
        cannonB1 = SKTexture(imageNamed: "cannonB1")
        cannonB0 = SKTexture(imageNamed: "cannonB0")
        cannonB2P = SKTexture(imageNamed: "cannonB2P")
        cannonB1P = SKTexture(imageNamed: "cannonB1P")
        cannonB0P = SKTexture(imageNamed: "cannonB0P")
        noB = SKTexture(imageNamed: "noB.png")
        noBP = SKTexture(imageNamed: "noBP.png")
        yesBP = SKTexture(imageNamed: "yesBP.png")
        spring1 = SKTexture(imageNamed: "spring1.png")
        spring2 = SKTexture(imageNamed: "spring2.png")
        spring3 = SKTexture(imageNamed: "spring3.png")
        spring4 = SKTexture(imageNamed: "spring4.png")
    }
    
    fileprivate static func initLoadingPromptAnimation() {
        var loadingPromptAnimation = [SKTexture]()
        loadingPromptAnimation += [loadingPrompt1!]
        loadingPromptAnimation += [loadingPrompt2!]
        loadingPromptAnimation += [loadingPrompt3!]
        loadingPromptAnimation += [loadingPrompt4!]
        loadingPromptAnimation += [loadingPrompt5!]
        self.loadingPromptAnimation = SKAction.repeatForever(SKAction.animate(with: loadingPromptAnimation, timePerFrame: 0.25))
    }
    
    static func getLoadingPromptAnimation() -> SKAction {
        if(self.loadingPromptAnimation == nil) {
            initLoadingPromptAnimation()
        }
        return self.loadingPromptAnimation!
    }
    
    fileprivate static func initNextButtonAnimation() {
        var nextButtonAnimation = [SKTexture]()
        nextButtonAnimation += [nextBAP!]
        self.nextButtonAnimation = SKAction.animate(with: nextButtonAnimation, timePerFrame: 0.01)
    }
    
    static func getNextButtonAnimation() -> SKAction {
        if(self.nextButtonAnimation == nil) {
            initNextButtonAnimation()
        }
        return self.nextButtonAnimation!
    }
    
    static func changeFinishButtonAnimation(texture: SKTexture) {
        var finishButtonAnimation = [SKTexture]()
        finishButtonAnimation += [texture]
        self.finishButtonAnimation = SKAction.animate(with: finishButtonAnimation, timePerFrame: 0.01)
    }
    
    static func getFinishButtonAnimation() -> SKAction {
        return self.finishButtonAnimation!
    }
    
    static func changeMenuButtonAnimation(texture: SKTexture) {
        var menuButtonAnimation = [SKTexture]()
        menuButtonAnimation += [texture]
        self.menuButtonAnimation = SKAction.animate(with: menuButtonAnimation, timePerFrame: 0.01)
    }
    
    static func getMenuButtonAnimation() -> SKAction {
        return self.menuButtonAnimation!
    }
    
    static func changeMenuButtonsAnimation(texture: SKTexture) {
        var menuButtonsAnimation = [SKTexture]()
        menuButtonsAnimation += [texture]
        self.menuButtonsAnimation = SKAction.animate(with: menuButtonsAnimation, timePerFrame: 0.01)
    }
    
    static func getMenuButtonsAnimation() -> SKAction {
        return self.menuButtonsAnimation!
    }
    
    fileprivate static func initLeverAnimation() {
        var leverAnimation = [SKTexture]()
        leverAnimation += [lever3!]
        leverAnimation += [lever4!]
        leverAnimation += [lever5!]
        leverAnimation += [lever6!]
        leverAnimation += [lever7!]
        leverAnimation += [lever8!]
        self.leverAnimation = SKAction.animate(with: leverAnimation, timePerFrame: 0.12)
    }
    
    static func getLeverAnimation() -> SKAction {
        if(self.leverAnimation == nil) {
            self.initLeverAnimation()
        }
        return self.leverAnimation!
    }
    
    fileprivate static func initLeverFinishAnimation() {
        var leverFinishAnimation = [SKTexture]()
        leverFinishAnimation += [lever9!]
        self.leverFinishAnimation = SKAction.animate(with: leverFinishAnimation, timePerFrame: 0.01)
    }
    
    static func getLeverFinishAnimation() -> SKAction {
        if(self.leverFinishAnimation == nil) {
            initLeverFinishAnimation()
        }
        return self.leverFinishAnimation!
    }
    
    fileprivate static func initOpenStartAnimation() {
        var openStartAnimation = [SKTexture]()
        openStartAnimation += [drf5!]
        openStartAnimation += [drf6!]
        openStartAnimation += [drf7!]
        openStartAnimation += [drf8!]
        openStartAnimation += [drf9!]
        openStartAnimation += [drf10!]
        openStartAnimation += [drf11!]
        self.openStartAnimation = SKAction.animate(with: openStartAnimation, timePerFrame: 0.08)
    }
    
    static func getOpenStartAnimation() -> SKAction {
        if(self.openStartAnimation == nil) {
            initOpenStartAnimation()
        }
        return self.openStartAnimation!
    }
    
    fileprivate static func initOpenLeftAnimation() {
        var openLeftAnimation = [SKTexture]()
        openLeftAnimation += [drb5!]
        openLeftAnimation += [drb6!]
        openLeftAnimation += [drb7!]
        openLeftAnimation += [drb8!]
        openLeftAnimation += [drb9!]
        openLeftAnimation += [drb10!]
        openLeftAnimation += [drb11!]
        self.openLeftAnimation = SKAction.animate(with: openLeftAnimation, timePerFrame: 0.08)
    }
    
    static func getOpenLeftAnimation() -> SKAction {
        if(self.openLeftAnimation == nil) {
            initOpenLeftAnimation()
        }
        return self.openLeftAnimation!
    }
    
    fileprivate static func initForwardAnimation() {
        var forwardAnimation = [SKTexture]()
        forwardAnimation += [dwf1!]
        forwardAnimation += [dwf2!]
        forwardAnimation += [dwf3!]
        forwardAnimation += [dwf4!]
        forwardAnimation += [dwf5!]
        forwardAnimation += [dwf6!]
        self.forwardAnimation = SKAction.repeatForever(SKAction.animate(with: forwardAnimation, timePerFrame: 0.12))
    }
    
    static func getForwardAnimation() -> SKAction {
        if(self.forwardAnimation == nil) {
            initForwardAnimation()
        }
        return self.forwardAnimation!
    }
    
    fileprivate static func initBackwardAnimation() {
        var backwardAnimation = [SKTexture]()
        backwardAnimation += [dwb1!]
        backwardAnimation += [dwb2!]
        backwardAnimation += [dwb3!]
        backwardAnimation += [dwb4!]
        backwardAnimation += [dwb5!]
        backwardAnimation += [dwb6!]
        self.backwardAnimation = SKAction.repeatForever(SKAction.animate(with: backwardAnimation, timePerFrame: 0.12))
    }
    
    static func getBackwardAnimation() -> SKAction {
        if(self.backwardAnimation == nil) {
            initBackwardAnimation()
        }
        return self.backwardAnimation!
    }
    
    fileprivate static func initCannonFireLeftAnimation() {
        var cannonFireLeftAnimation = [SKTexture]()
        cannonFireLeftAnimation += [cannon2L!]
        cannonFireLeftAnimation += [cannon3L!]
        cannonFireLeftAnimation += [cannon4L!]
        cannonFireLeftAnimation += [cannon5L!]
        cannonFireLeftAnimation += [cannon6L!]
        cannonFireLeftAnimation += [cannon7L!]
        cannonFireLeftAnimation += [cannon8L!]
        cannonFireLeftAnimation += [cannon9L!]
        cannonFireLeftAnimation += [cannon10L!]
        self.cannonFireLeftAnimation = SKAction.animate(with: cannonFireLeftAnimation, timePerFrame: 0.1)
    }

    static func getCannonFireLeftAnimation() -> SKAction {
        if(self.cannonFireLeftAnimation == nil) {
            initCannonFireLeftAnimation()
        }
        return self.cannonFireLeftAnimation!
    }

    fileprivate static func initCannonFinishLeft() {
        var cannonFinishLeft = [SKTexture]()
        cannonFinishLeft += [cannon11L!]
        cannonFinishLeft += [cannon12L!]
        cannonFinishLeft += [cannon1L!]
        self.cannonFinishLeft = SKAction.animate(with: cannonFinishLeft, timePerFrame: 0.18)
    }
    
    static func getCannonFinishLeft() -> SKAction {
        if(self.cannonFinishLeft == nil) {
            initCannonFinishLeft()
        }
        return self.cannonFinishLeft!
    }
    
    fileprivate static func initCannonFinishRight() {
        var cannonFinishRight = [SKTexture]()
        cannonFinishRight += [cannon11!]
        cannonFinishRight += [cannon12!]
        cannonFinishRight += [cannon1!]
        self.cannonFinishRight = SKAction.animate(with: cannonFinishRight, timePerFrame: 0.18)
    }
    
    static func getCannonFinishRight() -> SKAction {
        if(self.cannonFinishRight == nil) {
            initCannonFinishRight()
        }
        return self.cannonFinishRight!
    }

    fileprivate static func initCannonFireRightAnimation() {
        var cannonFireRightAnimation = [SKTexture]()
        cannonFireRightAnimation += [cannon2!]
        cannonFireRightAnimation += [cannon3!]
        cannonFireRightAnimation += [cannon4!]
        cannonFireRightAnimation += [cannon5!]
        cannonFireRightAnimation += [cannon6!]
        cannonFireRightAnimation += [cannon7!]
        cannonFireRightAnimation += [cannon8!]
        cannonFireRightAnimation += [cannon9!]
        cannonFireRightAnimation += [cannon10!]
        self.cannonFireRightAnimation = SKAction.animate(with: cannonFireRightAnimation, timePerFrame: 0.1)
    }
    
    static func getCannonFireRightAnimation() -> SKAction {
        if(self.cannonFireRightAnimation == nil) {
            initCannonFireRightAnimation()
        }
        return self.cannonFireRightAnimation!
    }
    
    fileprivate static func initCannonFaceLeft() {
        var cannonFaceLeft = [SKTexture]()
        cannonFaceLeft += [cannon1L!]
        self.cannonFaceLeft = SKAction.animate(with: cannonFaceLeft, timePerFrame: 0.01)
    }
    
    static func getCannonFaceLeft() -> SKAction {
        if(self.cannonFaceLeft == nil) {
            initCannonFaceLeft()
        }
        return self.cannonFaceLeft!
    }
    
    fileprivate static func initCannonFaceRight() {
        var cannonFaceRight = [SKTexture]()
        cannonFaceRight += [cannon1!]
        self.cannonFaceRight = SKAction.animate(with: cannonFaceRight, timePerFrame: 0.01)
    }
    
    static func getCannonFaceRight() -> SKAction {
        if(self.cannonFaceRight == nil) {
            initCannonFaceRight()
        }
        return self.cannonFaceRight!
    }
    
    fileprivate static func initDilloEnterBallRight() {
        var dilloEnterBallRight = [SKTexture]()
        dilloEnterBallRight += [drf5!]
        self.dilloEnterBallRight = SKAction.animate(with: dilloEnterBallRight, timePerFrame: 0.01)
    }
    
    static func getDilloEnterBallRight() -> SKAction {
        if(self.dilloEnterBallRight == nil) {
            initDilloEnterBallRight()
        }
        return self.dilloEnterBallRight!
    }
    
    fileprivate static func initDilloEnterBallLeft() {
        var dilloEnterBallLeft = [SKTexture]()
        dilloEnterBallLeft += [drb5!]
        self.dilloEnterBallLeft = SKAction.animate(with: dilloEnterBallLeft, timePerFrame: 0.01)
    }
    
    static func getDilloEnterBallLeft() -> SKAction {
        if(self.dilloEnterBallLeft == nil) {
            initDilloEnterBallLeft()
        }
        return self.dilloEnterBallLeft!
    }
    
    static func getNestAnimation() -> SKAction {
        return self.nestAnimation!
    }
    
    static func changeNestAnimation(texture: SKTexture) {
        var nestAnimation = [SKTexture]()
        nestAnimation += [texture]
        self.nestAnimation = SKAction.animate(with: nestAnimation, timePerFrame: 0.01)
    }
    
    static func changeSpringButtonAnimation(numberOfSprings: Int) {
        var springButtonAnimation = [SKTexture]()
        if(numberOfSprings == 2) {
            springButtonAnimation += [springB2!]
        } else if(numberOfSprings == 1) {
            springButtonAnimation += [springB1!]
        } else if(numberOfSprings == 0) {
            springButtonAnimation += [springB0!]
        }
        self.springButtonAnimation = SKAction.animate(with: springButtonAnimation, timePerFrame: 0.01)
    }
    
    static func getSpringButtonAnimation() -> SKAction {
        return self.springButtonAnimation!
    }
    
    static func changeSpringButtonPressedAnimation(numberOfSprings: Int) {
        var springButtonPressedAnimation = [SKTexture]()
        if(numberOfSprings == 2) {
            springButtonPressedAnimation += [springB2P!]
        }else if(numberOfSprings == 1) {
            springButtonPressedAnimation += [springB1P!]
        }else if(numberOfSprings == 0) {
            springButtonPressedAnimation += [springB0P!]
        }
        self.springButtonPressedAnimation = SKAction.animate(with: springButtonPressedAnimation, timePerFrame: 0.01)
    }
    
    static func getSpringButtonPressedAnimation() -> SKAction {
        return self.springButtonPressedAnimation!
    }
    
    static func changeCannonButtonAnimation(numberOfCannons: Int) {
        var cannonButtonAnimation = [SKTexture]()
        if(numberOfCannons == 2) {
            cannonButtonAnimation += [cannonB2!]
        }else if(numberOfCannons == 1) {
            cannonButtonAnimation += [cannonB1!]
        }else if(numberOfCannons == 0) {
            cannonButtonAnimation += [cannonB0!]
        }
        self.cannonButtonAnimation = SKAction.animate(with: cannonButtonAnimation, timePerFrame: 0.01)
    }
    
    static func getCannonButtonAnimation() -> SKAction {
        return self.cannonButtonAnimation!
    }
    
    static func changeCannonButtonPressedAnimation(numberOfCannons: Int) {
        var cannonButtonPressedAnimation = [SKTexture]()
        if(numberOfCannons == 2) {
            cannonButtonPressedAnimation += [cannonB2P!]
        }else if(numberOfCannons == 1) {
            cannonButtonPressedAnimation += [cannonB1P!]
        }else if(numberOfCannons == 0) {
            cannonButtonPressedAnimation += [cannonB0P!]
        }
        self.cannonButtonPressedAnimation = SKAction.animate(with: cannonButtonPressedAnimation, timePerFrame: 0.01)
    }
    
    static func getCannonButtonPressedAnimation() -> SKAction {
        return self.cannonButtonPressedAnimation!
    }
    
    static func addRestartButtonAnimation(texture: SKTexture) {
        var restartButtonAnimation = [SKTexture]()
        restartButtonAnimation += [texture]
        self.restartButtonAnimation = SKAction.animate(with: restartButtonAnimation, timePerFrame: 0.01)
    }
    
    static func getRestartButtonAnimation() -> SKAction {
        return self.restartButtonAnimation!
    }
    
    static func addRetryButtonAnimation(texture: SKTexture) {
        var retryButtonAnimation = [SKTexture]()
        retryButtonAnimation += [texture]
        self.retryButtonAnimation = SKAction.animate(with: retryButtonAnimation, timePerFrame: 0.01)
    }
    
    static func getRetryButtonAnimation() -> SKAction {
        return self.retryButtonAnimation!
    }
    
    fileprivate static func initNoButtonAnimation() {
        var noButtonAnimation = [SKTexture]()
        noButtonAnimation += [noBP!]
        self.noButtonAnimation = SKAction.animate(with: noButtonAnimation, timePerFrame: 0.01)
    }
    
    static func getNoButtonAnimation() -> SKAction {
        if(self.noButtonAnimation == nil) {
            initNoButtonAnimation()
        }
        return self.noButtonAnimation!
    }
    
    static func noRestartNoButton(noButton: NoButton) {
        var noButtonAnimation = [SKTexture]()
        noButtonAnimation += [noB!]
        noButton.run(SKAction.animate(with: noButtonAnimation, timePerFrame: 0.01))
        noButtonAnimation.removeAll()
        noButtonAnimation += [noBP!]
        self.noButtonAnimation = SKAction.animate(with: noButtonAnimation, timePerFrame: 0.01)
    }
    
    
    fileprivate static func initYesButtonAnimation() {
        var yesButtonAnimation = [SKTexture]()
        yesButtonAnimation += [yesBP!]
        self.yesButtonAnimation = SKAction.animate(with: yesButtonAnimation, timePerFrame: 0.01)
    }
    
    static func getYesButtonAnimation() -> SKAction {
        if(self.yesButtonAnimation == nil) {
            initYesButtonAnimation()
        }
        return self.yesButtonAnimation!
    }
    
    static func getOkayButtonAnimation() -> SKAction {
        return self.okayButtonAnimation!
    }
    
    static func changeOkayButtonAnimation(texture: SKTexture) {
        var okayButtonAmimation = [SKTexture]()
        okayButtonAmimation += [texture]
        self.okayButtonAnimation = SKAction.animate(with: okayButtonAmimation, timePerFrame: 0.01)
    }
    
    fileprivate static func initSpringAnimation() {
        var springAnimation = [SKTexture]()
        springAnimation += [spring3!]
        springAnimation += [spring2!]
        springAnimation += [spring1!]
        springAnimation += [spring4!]
        springAnimation += [spring1!]
        springAnimation += [spring2!]
        self.springAnimation = SKAction.animate(with: springAnimation, timePerFrame: 0.08)
    }
    
    static func getSpringAnimation() -> SKAction {
        if(self.springAnimation == nil) {
            initSpringAnimation()
        }
        return self.springAnimation!
    }
}
