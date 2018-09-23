//
//  LoginViewController.swift
//  Tap_Tap.Food
//
//  Created by larvataAndroid on 2018/8/16.
//  Copyright © 2018年 LAT. All rights reserved.
//

import UIKit
import FirebaseAuth

let primaryColor = UIColor(red: 210/255, green: 109/255, blue: 180/255, alpha: 1)
let secondaryColor = UIColor(red: 52/255, green: 148/255, blue: 230/255, alpha: 1)

class LoginViewController: UIViewController {

    var continueButton:RoundedWhiteButton!
    var activityView:UIActivityIndicatorView!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
//    @IBAction func LoginSuccessButtonAction(_ sender: UIButton) {
//        let startVC = MainVC()
//        navigationController?.pushViewController(startVC, animated: true)
//    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        authSignUp()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initFrame()
    }
    func authSignUp() {
        guard let userName = userNameField.text else {
            return
        }
        guard let email = emailField.text else {
            return
        }
        guard let password = passwordField.text else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if error == nil && user != nil {
                print("Sucess")
            } else {
                print("Error: \(error!.localizedDescription)")
            }
        }
    }

    func initFrame() {
        backGroundDesign()
    }
    func backGroundDesign() {
        let gradient = CAGradientLayer()
        gradient.frame = self.view.frame
        gradient.colors = [
            UIColor(red: 1, green: 0.8157, blue: 0, alpha: 1).cgColor,
            UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        ]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        self.view.layer.insertSublayer(gradient, at: 0)
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 10.0
        gradientChangeAnimation.toValue = [
            UIColor(red: 0.9882, green: 0.5412, blue: 0, alpha: 1.0).cgColor,
            UIColor(red: 1, green: 0.8157, blue: 0, alpha: 1).cgColor
        ]
        gradientChangeAnimation.fillMode = kCAFillModeForwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
    }

    func setContinueButton(enabled:Bool) {
        if enabled {
            continueButton.alpha = 1.0
            continueButton.isEnabled = true
        } else {
            continueButton.alpha = 0.5
            continueButton.isEnabled = false
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
