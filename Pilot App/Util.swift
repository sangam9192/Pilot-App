//
//  Util.swift
//  Pilot App
//
//  Created by Sangam KS on 06/07/16.
//  Copyright © 2016 Sangam. All rights reserved.
//

import Foundation
import UIKit

struct Util{
    
    static func displayAlert(viewController:UIViewController, title:String, message:String, completion:()->Void = {}, actions:UIAlertAction...){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        for action in actions {
            alertController.addAction(action)
        }
        viewController.presentViewController(alertController, animated: true, completion: nil)
    }
    
    static func isEmailValid(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)
    }
    
    static func isPasswordValid(password:String) -> Bool {
        let passwordRegex = "\\w{6,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return emailTest.evaluateWithObject(password)
    }
    
}