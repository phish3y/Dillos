//
//  CreateUsernameViewController.swift
//  Dillos
//
//  Created by Evan Logsdon on 1/27/19.
//  Copyright © 2019 logSquaredX. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CreateUsernameViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    override func viewDidLoad() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.closeKeyboard)))
    }
    
    @objc func closeKeyboard() {
        self.usernameField.endEditing(true)
    }
    
    @IBAction func createUser(_ sender: Any) {
        if self.usernameField.text!.count < 1 {
            self.presentError(errorDesc: "Username cannot be blank")
        } else {
            SVProgressHUD.show()
            
            let noScoreProgress = Array(repeating: 0, count: Metadata.getNumberOfLevels())
            // create database record for this user
            let userData = Database.database().reference().child("UserData")
            let userDataDictionary = ["username": self.usernameField.text!,
                                      "email": Auth.auth().currentUser!.email!,
                                      "maxScore": 0,
                                      "scores": noScoreProgress] as [String: Any]
            
            userData.child(Auth.auth().currentUser!.uid).setValue(userDataDictionary) {
                (error, reference) in
                SVProgressHUD.dismiss()
                if error != nil {
                    self.presentError(errorDesc: error!.localizedDescription)
                } else {
                    UserData.setUid(uid: Auth.auth().currentUser!.uid)
                    UserData.setUsername(username: self.usernameField.text!)
                    UserData.setMaxScore(maxScore: 0)
                    UserData.setScores(scores: noScoreProgress)
                    
                    self.performSegue(withIdentifier: "goToGame", sender: self)
                }
            }
        }
    }
    
    private func presentError(errorDesc: String) {
        let alertController = UIAlertController(title: "Error", message: errorDesc, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
