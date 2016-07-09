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
    
    var dismissToHomePage:Bool = false
    
    @IBAction func login(sender: AnyObject) {
        
        guard let username = usernameTextField.text where username.isValidEmail() else {
            let okAction = UIAlertAction(title: Constants.OK, style: .Default,
                                handler: {_ in self.usernameTextField.becomeFirstResponder()})
            UIUtil.displayAlert(self, title: Error.INVALID_USERNAME.title, message: Error.INVALID_USERNAME.message, actions: okAction)
            return
        }
        
        guard let password = passwordTextField.text where password.isValidPassword() else{
            let okAction = UIAlertAction(title: Constants.OK, style: .Default,
                                         handler: {_ in self.passwordTextField.becomeFirstResponder()})
            UIUtil.displayAlert(self, title: Error.INVALID_PASSWORD.title, message: Error.INVALID_PASSWORD.message, actions: okAction)
            return
        }
                
        UserUtil.createNewUser(username, password: password)
        
        if dismissToHomePage {
            showHomeScreen(transitionDelegate: self)
        } else {
            dismissViewControllerAnimated(true, completion: nil)
        }
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
