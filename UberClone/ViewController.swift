//
//  ViewController.swift
//  UberClone
//
//  Created by Rajvinder Singh on 7/12/20.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {

    @IBOutlet weak var driveLabel: UILabel!
    @IBOutlet weak var riderLabel: UILabel!
   
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var riderDriverSwitch: UISwitch!
    var signUpMode = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   @IBAction func signUpPressed(_ sender: UIButton) {
        if emailField.text == "" || passwordField.text == "" {
        displayAlert(title: "Missing Info", message: "You must enter info")
            
        }
        else {
            if let email = emailField.text {
            if let password = passwordField.text {
                if signUpMode {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if error != nil {
                            self.displayAlert(title: "error", message: error!.localizedDescription)
                        } else {
                            print("success")
                        }
                    }
                }else {
                    Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                      guard let strongSelf = self else { return }
                        if error != nil {
                            self?.displayAlert(title: "error", message: error!.localizedDescription)
                        } else {
                            print("success")
                        }
                    }
                }
              
                    }
                }
            }
   }
    
    func displayAlert(title:String , message:String){
        let alertController = UIAlertController(title: title, message: message , preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if signUpMode {
            signButton.setTitle("login ", for: .normal)
            loginButton.setTitle("switch to sign up ", for: .normal)
            riderLabel.isHidden = true
            driveLabel.isHidden = true
            riderDriverSwitch.isHidden = true
            signUpMode = false
        }else {
            signButton.setTitle("signup  ", for: .normal)
            loginButton.setTitle("switch to login ", for: .normal)
            riderLabel.isHidden = false
            driveLabel.isHidden = false
            riderDriverSwitch.isHidden = false
            signUpMode = true
        }
    }
}

