//
//  RegisterViewController.swift
//  Dillos
//
//  Created by Evan Logsdon on 1/25/19.
//  Copyright © 2019 logSquaredX. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.closeKeyboard)))
    }
    
    @objc func closeKeyboard() {
        self.emailField.endEditing(true)
        self.passwordField.endEditing(true)
    }
    
    @IBAction func registerUser(_ sender: Any) {
        SVProgressHUD.show()
        // create auth record for user
        Auth.auth().createUser(withEmail: self.emailField.text!, password: self.passwordField.text!) { (user, error) in
            SVProgressHUD.dismiss()
            if error != nil {
                self.presentError(errorDesc: error!.localizedDescription)
            } else {
                self.performSegue(withIdentifier: "goToCreateUsername", sender: self)
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
