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

}


