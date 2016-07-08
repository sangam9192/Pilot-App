//
//  LoginViewController.swift
//  Pilot App
//
//  Created by Sangam KS on 05/07/16.
//  Copyright © 2016 Sangam. All rights reserved.
//

import UIKit

class LoginViewController:UIViewController{
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func login(sender: AnyObject) {
        guard let username = usernameTextField.text where username.isValidEmail() else {
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: {(_)->Void in self.usernameTextField.becomeFirstResponder()})
            UIUtil.displayAlert(self, title: "Invalid Username", message: "Please enter a valid email", actions: okAction)
            return
        }
        
        guard let password = passwordTextField.text where password.isValidPassword() else{
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: {(_)->Void in self.passwordTextField.becomeFirstResponder()})
            UIUtil.displayAlert(self, title: "Invalid Password", message: "Password should be 6 characters long, should contain alphabets and numbers", actions: okAction)
            return
        }
        
        UserUtil.createNewUser(username, password: password)
        showHomeScreen(transitionDelegate: self)
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        view.endEditing(true)
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

extension LoginViewController: UIViewControllerTransitioningDelegate{
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
}
