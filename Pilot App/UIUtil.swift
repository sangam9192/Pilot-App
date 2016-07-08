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
                                      storyBoardName : String = "Main", animated flag: Bool = true, completion : (() -> Void)? = nil){
        let welcomePage = UIStoryboard(name: storyBoardName, bundle:nil).instantiateViewControllerWithIdentifier(viewControllerIdentifierToPresent)
        if let transition = transitionDelegate {
            welcomePage.transitioningDelegate = transition
        }
        fromView.presentViewController(welcomePage, animated: flag, completion: completion)
    }
    
}

extension UIViewController{
    
    func showHomeScreen(transitionDelegate transitionDelegate:UIViewControllerTransitioningDelegate? = nil,animated flag: Bool = true, completion : (() -> Void)? = nil){
            UIUtil.presentViewController(self, viewControllerIdentifierToPresent: "HomeScreen", animated: flag, completion: completion, transitionDelegate: transitionDelegate)
    }
        
    func showLoginScreen(transitionDelegate transitionDelegate:UIViewControllerTransitioningDelegate? = nil,animated flag: Bool = true, completion : (() -> Void)? = nil){
            UIUtil.presentViewController(self, viewControllerIdentifierToPresent: "LoginScreen", animated: flag, completion: completion,transitionDelegate: transitionDelegate)
    }

}
    

