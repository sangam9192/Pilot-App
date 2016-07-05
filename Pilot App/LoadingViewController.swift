//
//  ViewController.swift
//  Pilot App
//
//  Created by Sangam KS on 05/07/16.
//  Copyright © 2016 Sangam. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController,UIViewControllerTransitioningDelegate {

    let activityView = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    
    let transition = Animator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityView.center = view.center
        activityView.startAnimating()
        self.view.addSubview(activityView)
        super.modalTransitionStyle = .CrossDissolve
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // animation methods
    func animationControllerForPresentedController(
        presented: UIViewController,
        presentingController presenting: UIViewController,
                             sourceController source: UIViewController) ->
        UIViewControllerAnimatedTransitioning? {
            
            return transition
    }
    
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }

}


