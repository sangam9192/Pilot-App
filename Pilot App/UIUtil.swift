//
//  UIUtil.swift
//  Pilot App
//
//  Created by Sangam KS on 06/07/16.
//  Copyright © 2016 Sangam. All rights reserved.
//

import UIKit

struct UIUtil {
    
    static func displayAlert(viewController:UIViewController, title:String, message:String,
                             completion:(()->Void)?=nil, animated:Bool=true, preferredStyle:UIAlertControllerStyle = .Alert, actions:UIAlertAction...){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        for action in actions {
            alertController.addAction(action)
        }
        viewController.presentViewController(alertController, animated: animated, completion: completion)
    }
    
    static func presentViewController(fromView :UIViewController, viewControllerIdentifierToPresent :String ,transitionDelegate:UIViewControllerTransitioningDelegate? = nil,
                                      storyBoardName : String = Constants.MAIN, animated flag: Bool = true, completion : (() -> Void)? = nil){
        let vcToPresent = UIStoryboard(name: storyBoardName, bundle:nil).instantiateViewControllerWithIdentifier(viewControllerIdentifierToPresent)
        if let transition = transitionDelegate {
            vcToPresent.transitioningDelegate = transition
        }
        fromView.presentViewController(vcToPresent, animated: flag, completion: completion)
    }
    
}

extension UIViewController{
    
    func showHomeScreen(transitionDelegate transitionDelegate:UIViewControllerTransitioningDelegate? = nil,animated flag: Bool = true, completion : (() -> Void)? = nil){
        UIUtil.presentViewController(self, viewControllerIdentifierToPresent: Constants.NAVIGATION_CONTROLLER, animated: flag, completion: completion, transitionDelegate: transitionDelegate)
    }
        
    func showLoginScreen(transitionDelegate transitionDelegate:UIViewControllerTransitioningDelegate? = nil,animated flag: Bool = true, dismissToHomePage:Bool=false, completion : (() -> Void)? = nil){
        
        let vcToPresent = UIStoryboard(name: Constants.MAIN, bundle:nil).instantiateViewControllerWithIdentifier(Constants.LOGIN_SCREEN) as! LoginViewController
        vcToPresent.dismissToHomePage = dismissToHomePage
        if let transition = transitionDelegate {
            vcToPresent.transitioningDelegate = transition
        }
        self.presentViewController(vcToPresent, animated: flag, completion: completion)
    }
}
    

