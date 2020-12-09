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
    @IBOutlet var passwordField: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var riderDriverSwitch: UISwitch!
    var signUpMode = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func signUpButtonPressed(_ sender: Any) {
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if signUpMode {
            signButton.setTitle("login ", for: .normal)
            loginButton.setTitle("switch to sign up ", for: .normal)
            riderLabel.isHidden = true
            driveLabel.isHidden = true
            riderDriverSwitch.isHidden = true
        }else {
            signButton.setTitle("signup  ", for: .normal)
            loginButton.setTitle("switch to login ", for: .normal)
            riderLabel.isHidden = false
            driveLabel.isHidden = false
            riderDriverSwitch.isHidden = false
        }
    }
}

