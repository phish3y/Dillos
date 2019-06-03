//
//  Leaderboard.swift
//  Dillos
//
//  Created by Evan Logsdon on 2/8/19.
//  Copyright © 2019 logSquaredX. All rights reserved.
//

import SpriteKit
import Firebase

class Leaderboard {
    
    var leaderboardButton: LeaderboardButton?
    
    var leaderboardOpen = false
    
    var leaderboardFrame: SKSpriteNode?
    
    var leaderboardCloseButtonPressed = false
    var leaderboardCloseButton: SKSpriteNode?
    
    var leaderboardNumbers: [SKLabelNode]?
    var leaderboardText: [SKLabelNode: SKLabelNode]?
    
    // scroll
    var originalScrolLLocationY: CGFloat?
    var leaderboardScrolling: Bool?
    var leaderboardScrollMaxY: CGFloat?
    var leaderboardScrollMinY: CGFloat?
    var leaderboardScroll: SKSpriteNode?
    
    init(scene: SKScene) {
        // leaderboard button
        self.leaderboardButton = LeaderboardButton(posX: 0.351, posY: -0.335)
        scene.addChild(self.leaderboardButton!)
    }
    
    func touchLeaderboardButton(touchLocation: CGPoint, packMenuOpen: Bool, levelMenuOpen: Bool) {
        // leaderboard button
        if(self.leaderboardButton!.contains(touchLocation) && !packMenuOpen && !levelMenuOpen && !Locker.getButtonLock() && !self.leaderboardOpen) {
            self.leaderboardButton!.touchBegin()
        }
    }
    
    func scrollBegin(touchLocation: CGPoint) {
        if(self.leaderboardScroll != nil && self.leaderboardScroll!.contains(touchLocation) && self.leaderboardOpen && !self.leaderboardScrolling!) {
            self.leaderboardScrolling = true
            self.originalScrolLLocationY = touchLocation.y
        }
    }
    
    func scroll(touchLocation: CGPoint) {
        if(self.leaderboardScroll != nil && self.leaderboardOpen) {
            let scroll = touchLocation.y - self.originalScrolLLocationY!
            if(self.leaderboardScrolling!) {
                if((self.leaderboardScroll!.frame.midY + scroll) < self.leaderboardScrollMinY! && (self.leaderboardScroll!.frame.midY + scroll) > self.leaderboardScrollMaxY!) {
                    self.leaderboardScroll!.position.y = self.leaderboardScroll!.position.y + scroll
                    for(rank) in self.leaderboardNumbers! {
                        rank.position.y = rank.position.y + scroll
                    }
                    for(user, score) in self.leaderboardText! {
                        user.position.y = user.position.y + scroll
                        score.position.y = score.position.y + scroll
                    }
                }
                self.originalScrolLLocationY = touchLocation.y
            }
        }
    }
    
    func scrollEnd() {
        if(self.leaderboardScrolling != nil && self.leaderboardScrolling!) {
            self.leaderboardScrolling = false
        }
    }
    
    func touchCloseLeaderboard(touchLocation: CGPoint) {
        if(self.leaderboardCloseButton != nil && self.leaderboardCloseButton!.contains(touchLocation) && self.leaderboardOpen && !self.leaderboardScrolling!) {
            self.leaderboardCloseButtonPressed = true
        }
    }
    
    func releaseCloseLeaderboard() {
        if(self.leaderboardCloseButtonPressed) {
            self.leaderboardCloseButtonPressed = false
            self.leaderboardOpen = false
            self.leaderboardCloseButton!.removeFromParent()
            self.leaderboardScroll!.removeFromParent()
            self.leaderboardFrame!.removeFromParent()
            
            for(rank) in self.leaderboardNumbers! {
                rank.removeFromParent()
            }
            
            for(user, score) in self.leaderboardText! {
                user.removeFromParent()
                score.removeFromParent()
            }
        }
    }
    
    func openLeaderboard(scene: SKScene) {
        if(self.leaderboardButton!.getChangeBool()) {
            self.leaderboardButton!.touchRelease()
            if(self.leaderboardFrame == nil) {
                self.leaderboardFrame = SKSpriteNode(imageNamed: "leaderboardFrame.png")
                self.leaderboardFrame!.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
                self.leaderboardFrame!.zPosition = 2.1
                self.leaderboardFrame!.size = CGSize(width: (self.leaderboardFrame!.size.width/2208) * Screen.screen!.width, height: (self.leaderboardFrame!.size.height/1242) * Screen.screen!.height)
                
                self.leaderboardScroll = SKSpriteNode(imageNamed: "leaderboard.png")
                self.leaderboardScrollMaxY = Screen.screen!.minY * 1.98
                self.leaderboardScrollMinY = Screen.screen!.minY * -1.95
                self.leaderboardScroll!.position = CGPoint(x: scene.frame.midX, y: self.leaderboardScrollMaxY!)
                self.leaderboardScroll!.zPosition = 2.0
                self.leaderboardScroll!.size = CGSize(width: (self.leaderboardScroll!.size.width/2208) * Screen.screen!.width, height: (self.leaderboardScroll!.size.height/1242) * Screen.screen!.height)
                
                self.leaderboardCloseButton = SKSpriteNode(imageNamed: "close.png")
                self.leaderboardCloseButton!.size = CGSize(width: Screen.screen!.width * 0.05, height: Screen.screen!.height * 0.08)
                self.leaderboardCloseButton!.position = CGPoint(x: Screen.screen!.width * 0.428, y: Screen.screen!.height * 0.388)
                self.leaderboardCloseButton!.zPosition = 2.2
            }
            self.getTopScores(scene: scene)
            scene.addChild(self.leaderboardFrame!)
            scene.addChild(self.leaderboardScroll!)
            scene.addChild(self.leaderboardCloseButton!)
        }
    }
    
    func getTopScores(scene: SKScene) {
        
        var topScores = [Int: String]()
        let orderedQuery = Database.database().reference().child("UserData").queryOrdered(byChild: "maxScore").queryLimited(toLast: 10)
        orderedQuery.observeSingleEvent(of: .value) { (snapshot) in
            
            if let snapshotValue = snapshot.value as? Dictionary<String, Dictionary<String, Any>> {
                for (_, stats) in snapshotValue {
                    topScores[stats["maxScore"] as! Int] = String(describing: stats["username"]!)
                }
            }
            let sortedTopScores = topScores.sorted(by: >)
            self.buildLeaderboardText(scene: scene, sortedTopScores: sortedTopScores)
        }
    }
    
    /**
     Build the leaderboard
     */
    func buildLeaderboardText(scene: SKScene, sortedTopScores: [(key: Int, value: String)]) {
        var sortedTopScoresTemp = sortedTopScores
        self.leaderboardText = [SKLabelNode: SKLabelNode]()
        self.leaderboardNumbers = [SKLabelNode]()
        var counter = 0
        var ySpace = CGFloat(0)
        while(sortedTopScoresTemp.count > 0) {
            let scorePair: (key: Int, value: String) = sortedTopScoresTemp.remove(at: 0)
            
            let user = SKLabelNode(fontNamed: "MarkerFelt-Wide")
            user.text = scorePair.value
            user.position = CGPoint(x: Screen.screen!.width * -0.18, y: (Screen.screen!.height * 0.193) - ySpace)
            user.fontSize = CGFloat(Screen.screen!.width * 0.04)
            user.zPosition = 2.05
            user.fontColor = SKColor.black
            
            let score = SKLabelNode(fontNamed: "MarkerFelt-Wide")
            score.text = String(scorePair.key)
            score.position = CGPoint(x: Screen.screen!.width * 0.22, y: (Screen.screen!.height * 0.193) - ySpace)
            score.fontSize = CGFloat(Screen.screen!.width * 0.04)
            score.zPosition = 2.05
            score.fontColor = SKColor.black
            
            let rank = SKLabelNode(fontNamed: "MarkerFelt-Wide")
            rank.text = String(describing: counter + 1) + "."
            rank.position = CGPoint(x: Screen.screen!.width * -0.34, y: (Screen.screen!.height * 0.193) - ySpace)
            rank.fontSize = CGFloat(Screen.screen!.width * 0.04)
            rank.zPosition = 2.05
            rank.fontColor = SKColor.black
            
            self.leaderboardText![user] = score
            self.leaderboardNumbers!.append(rank)
            counter += 1
            ySpace += (Screen.screen!.height * 0.102)
        }
        
        for(user, score) in self.leaderboardText! {
            scene.addChild(user)
            scene.addChild(score)
        }
        for(rank) in self.leaderboardNumbers! {
            scene.addChild(rank)
        }
        self.leaderboardOpen = true
        self.leaderboardScrolling = false
    }
}
