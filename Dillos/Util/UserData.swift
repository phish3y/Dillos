//
//  UserData.swift
//  Dillos
//
//  Created by Evan Logsdon on 1/27/19.
//  Copyright © 2019 logSquaredX. All rights reserved.
//

import Firebase

class UserData {
    
    private static var uid: String?
    private static var username: String?
    private static var maxScore: Int?
    private static var scores: [Int]?
    
    static func setUid(uid: String) {
        self.uid = uid
    }
    
    static func getUid() -> String {
        return self.uid!
    }
    
    static func setUsername(username: String) {
        self.username = username
    }
    
    static func getUsername() -> String {
        return self.username!
    }
    
    static func setMaxScore(maxScore: Int) {
        self.maxScore = maxScore
    }
    
    static func getMaxScore() -> Int {
        return self.maxScore!
    }
    
    static func setScores(scores: [Int]) {
        self.scores = scores
    }
    
    static func getScore(level: Int) -> Int {
        return self.scores![level - 1]
    }
    
    static func updateScore(level: Int, score: Int) {
        self.scores![level - 1] = score
    }
    
    static func saveData() {
        
        // calculate max score
        var maxScore = 0
        for score in self.scores! {
            maxScore += score
        }
        
        // create database record for this user
        let userData = Database.database().reference().child("UserData").child(Auth.auth().currentUser!.uid)
        let userDataDictionary = ["username": self.username!,
                                  "email": Auth.auth().currentUser!.email!,
                                  "maxScore": maxScore,
                                  "scores": self.scores!] as [String: Any]
        
        userData.setValue(userDataDictionary) {
            (error, reference) in
            // nothing
        }
    }
}
