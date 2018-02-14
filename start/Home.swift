//
//  Home.swift
//  start
//
//  Created by Linder Hassinger on 2/12/18.
//  Copyright © 2018 Linder Hassinger. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class HomeController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    @IBAction func loginButton(_ sender: Any) {
        if self.username.text == "" || self.password.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Rellene los campos", preferredStyle: .alert)
            let actionAlert = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alertController.addAction(actionAlert)
            self.present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().signIn(withEmail: self.username.text!, password: self.password.text!) { (user, error) in

                if error == nil {
                    print("Login exitoso")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaulAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
                    alertController.addAction(defaulAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }

}
