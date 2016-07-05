//
//  LoginViewController.swift
//  Pilot App
//
//  Created by Sangam KS on 05/07/16.
//  Copyright © 2016 Sangam. All rights reserved.
//

import UIKit

class LoginViewController:UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func login(sender: AnyObject) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        if(!Util.isEmailValid(username)){
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: {(_)->Void in self.usernameTextField.becomeFirstResponder()})
            Util.displayAlert(self, title: "Invalid Username", message: "Please enter a valid email", actions: okAction)
            return
        }
        if(!Util.isPasswordValid(password)){
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: {(_)->Void in self.passwordTextField.becomeFirstResponder()})
            Util.displayAlert(self, title: "Invalid Password", message: "Password should be 6 characters long, should contain alphabets and numbers", actions: okAction)
            return
        }
        let welcomePage = UIStoryboard(name: "Main", bundle:nil).instantiateViewControllerWithIdentifier("WelcomePage")
        presentViewController(welcomePage, animated: true, completion: nil)
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if(textField == usernameTextField){
            passwordTextField.becomeFirstResponder()
        }else{
            login(textField)
        }
        return true;
    }
    
    
    
    func login(){
        print("logging in")
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        view.endEditing(true)
    }
 
}
