//
//  MainRegistrationViewController.swift
//  SOS
//
//  Created by ITLabAdmin on 10/21/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class MainRegistrationViewController: UIViewController {

    let colorForSignUp = UIColor(red: 151.0/255.0, green: 109.0/255.0, blue: 208.0/255.0, alpha: 1.0).cgColor
    @IBOutlet weak var userNameTextField: UITextField! {
        didSet {
            userNameTextField.layer.borderWidth = 1
            userNameTextField.layer.cornerRadius = 5
            userNameTextField.layer.borderColor = colorForSignUp
        }
    }
    @IBOutlet weak var userSurnameTextField: UITextField! {
        didSet {
            userSurnameTextField.layer.borderWidth = 1
            userSurnameTextField.layer.cornerRadius = 5
            userSurnameTextField.layer.borderColor = colorForSignUp
        }
    }
    @IBOutlet weak var userPhoneNumberTextField: UITextField! {
        didSet {
            userPhoneNumberTextField.layer.borderWidth = 1
            userPhoneNumberTextField.layer.cornerRadius = 5
            userPhoneNumberTextField.layer.borderColor = colorForSignUp
        }
    }
    @IBOutlet weak var userPasswordTextField: UITextField! {
        didSet {
            userPasswordTextField.layer.borderWidth = 1
            userPasswordTextField.layer.cornerRadius = 5
            userPasswordTextField.layer.borderColor = colorForSignUp
        }
    }
    @IBOutlet weak var userConfirmedPasswordTextField: UITextField! {
        didSet {
            userConfirmedPasswordTextField.layer.borderWidth = 1
            userConfirmedPasswordTextField.layer.cornerRadius = 5
            userConfirmedPasswordTextField.layer.borderColor = colorForSignUp
        }
    }
    @IBOutlet weak var userEmailTextField: UITextField! {
        didSet {
            userEmailTextField.layer.borderWidth = 1
            userEmailTextField.layer.cornerRadius = 5
            userEmailTextField.layer.borderColor = colorForSignUp
        }
    }
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.borderWidth = 1
            nextButton.layer.cornerRadius = 5
            nextButton.layer.borderColor = colorForSignUp
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
