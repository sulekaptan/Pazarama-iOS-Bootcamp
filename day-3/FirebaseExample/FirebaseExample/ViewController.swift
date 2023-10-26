//
//  ViewController.swift
//  FirebaseExample
//
//  Created by Şule Kaptan on 20.10.2023.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        let userEmail = emailTextField.text!
        let userPassword = passwordTextField.text!
        
        Auth.auth().createUser(withEmail: "sule@gmail.com", password: "123456") { result, error in
            if error != nil {
                print(error?.localizedDescription)
            }
            else {
                self.performSegue(withIdentifier: "mySegue", sender: nil)
            }
        }
    }
    
    @IBAction func signInButtonClicked(_ sender: Any) {
        let userEmail = emailTextField.text!
        let userPassword = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { result, error in
            if error != nil {
                print(error)
            }
            else {
                self.performSegue(withIdentifier: "mySegue", sender: nil)
            }
        }
    }
    
}

