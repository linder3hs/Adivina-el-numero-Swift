//
//  LoginViewController.swift
//  start
//
//  Created by Linder Hassinger on 2/12/18.
//  Copyright © 2018 Linder Hassinger. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!


    @IBAction func login(_ sender: Any) {
        if username.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Ingrese un username and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().createUser(withEmail: username.text!, password: password.text!) {(user, error) in
                if error == nil {
                    print("Se registro exitosamente")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home" )
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

    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
    }
}
