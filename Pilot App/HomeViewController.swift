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
        usernameLabel.text = "\(UserUtil.userName)"
    }
    
    @IBAction func logout(sender: AnyObject) {
        UserUtil.logout()
        self.showLoginScreen(transitionDelegate: self)
    }
    
}

extension HomeViewController: UIViewControllerTransitioningDelegate{
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PushAnimator()
    }
}