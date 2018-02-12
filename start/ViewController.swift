//
//  ViewController.swift
//  start
//
//  Created by Linder Hassinger on 2/11/18.
//  Copyright © 2018 Linder Hassinger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTxt: UITextField!
    @IBOutlet weak var intentos: UILabel!
    @IBOutlet weak var message: UILabel!

    var intento = 0
    var random = ""
    @IBAction func validar(_ sender: Any) {

        // Validar datos
        if numberTxt.text == random {
            message.text = "Felicidades ganaste"
            self.view.backgroundColor = #colorLiteral(red: 0.1897187925, green: 0.5628422499, blue: 0.4235308899, alpha: 1)
            showAlert()
        } else {
            message.text = "Fallaste intenta de nuevo"
            if intento == 1 {
                self.view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                showAlert()
            } else {
                intento -= 1
                intentos.text = String(intento)
                message.text = "Juega de nuevo"
                numberTxt.text = ""
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setValues()

    }

    func showAlert() {
        let alert = UIAlertController(title: nil, message: "Intenta de nuevo", preferredStyle: .alert)
        let playAgain = UIAlertAction(title: "Juega de nuevo", style: .default) { (UIAlertAction) in
            self.setValues()
        }
        alert.addAction(playAgain)
        self.present(alert, animated: true, completion: nil)
    }

    func setValues() {
        random = String(arc4random_uniform(10))
        print(random)
        intento = 5
        intentos.text = String(intento)
        numberTxt.text = ""
        message.text = "Ingresa un numero del  0 - 9"
        self.view.backgroundColor = #colorLiteral(red: 0.1897187925, green: 0.5628422499, blue: 0.4235308899, alpha: 1)
        
    }
}

