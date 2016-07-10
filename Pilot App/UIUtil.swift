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
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        for action in actions {
            alertController.addAction(action)
        }
        viewController.presentViewController(alertController, animated: animated, completion: completion)
    }
    
    static func presentViewController(fromVC fromVC :UIViewController, vcIdentifierToPresent :String, useToVcAsTransitionDelegate:Bool = false,
                                      modaltransitionStyle:UIModalTransitionStyle? = nil, transitionDelegate:UIViewControllerTransitioningDelegate? = nil,
                                      storyBoardName : String = Constants.MAIN, animated flag: Bool = true, completion : (() -> Void)? = nil){
        let toVC = UIStoryboard(name: storyBoardName, bundle:nil).instantiateViewControllerWithIdentifier(vcIdentifierToPresent)
        toVC.transitioningDelegate = transitionDelegate
        if useToVcAsTransitionDelegate {
            toVC.transitioningDelegate = toVC as? UIViewControllerTransitioningDelegate
        }
        if let transitionStyle = modaltransitionStyle {
            toVC.modalTransitionStyle = transitionStyle
        }
        fromVC.presentViewController(toVC, animated: flag, completion: completion)
    }
    
}

extension UIViewController {

    func showHomeScreen(useToVcAsTransitionDelegate:Bool = false,
                               modaltransitionStyle:UIModalTransitionStyle? = nil, transitionDelegate:UIViewControllerTransitioningDelegate? = nil,
                               storyBoardName : String = Constants.MAIN, animated flag: Bool = true, completion : (() -> Void)? = nil){
        UIUtil.presentViewController(fromVC: self, vcIdentifierToPresent: Constants.HOME_SCREEN, useToVcAsTransitionDelegate: useToVcAsTransitionDelegate, modaltransitionStyle: modaltransitionStyle, transitionDelegate: transitionDelegate, animated : flag, completion: completion)
    }

    func showLoginScreen(useToVcAsTransitionDelegate:Bool = false,
                         modaltransitionStyle:UIModalTransitionStyle? = nil, transitionDelegate:UIViewControllerTransitioningDelegate? = nil,
                         storyBoardName : String = Constants.MAIN, animated flag: Bool = true, dismissToHomePage:Bool = false, completion : (() -> Void)? = nil){
        let toVC = UIStoryboard(name: storyBoardName, bundle:nil).instantiateViewControllerWithIdentifier(Constants.LOGIN_SCREEN) as! LoginViewController
        toVC.transitioningDelegate = transitionDelegate
        if useToVcAsTransitionDelegate {
            toVC.transitioningDelegate = toVC
        }
        if let transitionStyle = modaltransitionStyle {
            toVC.modalTransitionStyle = transitionStyle
        }
        toVC.dismissToHomePage = dismissToHomePage
        self.presentViewController(toVC, animated: flag, completion: completion)
    }
}

