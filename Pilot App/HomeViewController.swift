//
//  HomeViewController.swift
//  Pilot App
//
//  Created by Sangam KS on 06/07/16.
//  Copyright © 2016 Sangam. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
   
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        usernameLabel.text = "\(UserUtil.username)"
    }
    
    
    @IBAction private func logout(sender: AnyObject) {
        UserUtil.logout()
        let loginVC = UIStoryboard(name: Constants.MAIN, bundle:nil).instantiateViewControllerWithIdentifier(Constants.LOGIN_SCREEN) as! LoginViewController
        loginVC.state = .LOGIN_STATE
        presentViewController(loginVC, animated: true, completion: nil)
    }
    
}
