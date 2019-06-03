//
//  LoginViewController.swift
//  Dillos
//
//  Created by PHISH3Y on 1/19/19.
//  Copyright © 2019 logSquaredX. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.closeKeyboard)))
    }
    
    @objc func closeKeyboard() {
        self.emailField.endEditing(true)
        self.passwordField.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        SVProgressHUD.show()
        if let currentUser = Auth.auth().currentUser {
            currentUser.getIDTokenForcingRefresh(true, completion: { (token, error) in
                if error == nil && token != nil {
                    // user token found
                    // auto login the user
                    self.getUserData()
                } else {
                    SVProgressHUD.dismiss()
                }
            })
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
    @IBAction func signIn(_ sender: Any) {
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: self.emailField.text!, password: self.passwordField.text!) { (user, error) in
            if error != nil {
                SVProgressHUD.dismiss()
                self.presentError(errorDesc: error!.localizedDescription)
            } else {
                self.getUserData()
            }
        }
    }
    
    @IBAction func goToRegister(_ sender: Any) {
        self.performSegue(withIdentifier: "goToRegister", sender: self)
    }
    
    private func getUserData() {
        let userDataDb = Database.database().reference().child("UserData").child(Auth.auth().currentUser!.uid)
        userDataDb.observeSingleEvent(of: .value, with: { (snapshot) in
            SVProgressHUD.dismiss()
            if let snapshotValue = snapshot.value as? Dictionary<String, Any> {
                UserData.setUsername(username: snapshotValue["username"] as! String)
                UserData.setUid(uid: Auth.auth().currentUser!.uid)
                UserData.setMaxScore(maxScore: snapshotValue["maxScore"] as! Int)
                UserData.setScores(scores: snapshotValue["scores"] as! [Int])
                
                self.performSegue(withIdentifier: "goToGame", sender: self)
            } else {
                self.performSegue(withIdentifier: "goToCreateUsername", sender: self)
            }
        })
    }
    
    private func presentError(errorDesc: String) {
        let alertController = UIAlertController(title: "Error", message: errorDesc, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(action)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
