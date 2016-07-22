//
//  LoginViewController.swift
//  Pilot App
//
//  Created by Sangam KS on 05/07/16.
//  Copyright © 2016 Sangam. All rights reserved.
//

import UIKit

class LoginViewController:UIViewController{
    
    @IBOutlet weak private var usernameTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var loginButton: UIButton!
    
    @IBOutlet weak private var spinner: UIActivityIndicatorView!
    @IBOutlet weak private var signingInLabel: UILabel!
    
    
    enum State {
     case LOGIN_STATE
     case LOADING_STATE
    }
    
    var state:State = .LOADING_STATE
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        switch state {
        case .LOADING_STATE:
            showLoadingState()
        case .LOGIN_STATE:
            showLoginState()
        }
    }
    

    
    @IBAction private func login(sender: AnyObject) {
        
        guard let username = usernameTextField.text where Util.isValidEmail(username) else {
            let okAction = UIAlertAction(title: Constants.OK, style: .Default,
                                handler: {_ in self.usernameTextField.becomeFirstResponder()})
            UIUtil.displayAlert(self, title: Error.INVALID_USERNAME.title, message: Error.INVALID_USERNAME.message, actions: okAction)
            return
        }
        
        guard let password = passwordTextField.text where Util.isValidPassword(password) else{
            let okAction = UIAlertAction(title: Constants.OK, style: .Default,
                                         handler: {_ in self.passwordTextField.becomeFirstResponder()})
            UIUtil.displayAlert(self, title: Error.INVALID_PASSWORD.title, message: Error.INVALID_PASSWORD.message, actions: okAction)
            return
        }
                
        UserUtil.createNewUser(username, password: password)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction private func dismissKeyboard(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func showLoadingState(){
        spinner.startAnimating()
        signingInLabel.hidden = false
        usernameTextField.hidden = true
        passwordTextField.hidden = true
        loginButton.hidden = true
    }
    
    
    func showLoginState(){
        usernameTextField.hidden = false
        passwordTextField.hidden = false
        loginButton.hidden = false
        spinner.stopAnimating()
        signingInLabel.hidden = true
    }
    
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if(textField == usernameTextField){
            passwordTextField.becomeFirstResponder()
        }else{
            login(textField)
        }
        return true;
    }
}

