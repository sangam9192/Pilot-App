//
//  ViewController.swift
//  Pilot App
//
//  Created by Sangam KS on 05/07/16.
//  Copyright © 2016 Sangam. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    let activityView = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityView.color = UIColor.blueColor()
        activityView.center = view.center
        activityView.startAnimating()
        self.view.addSubview(activityView)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let completion:()->Void = { _ in self.activityView.stopAnimating()}
        UserUtil.isUserLoggedIn() ? self.showHomeScreen(transitionDelegate:self, completion: completion) : self.showLoginScreen(transitionDelegate: self, completion: completion)
    }
}

extension LoadingViewController: UIViewControllerTransitioningDelegate{
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeInAnimator()
    }
}

