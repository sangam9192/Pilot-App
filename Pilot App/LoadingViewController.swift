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
        activityView.color = UIColor.blackColor()
        activityView.center = view.center
        activityView.startAnimating()
        self.view.addSubview(activityView)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let completion:()->Void = { _ in self.activityView.stopAnimating()}
        
        UserUtil.isUserLoggedIn() ? showHomeScreen(modaltransitionStyle: .CrossDissolve, completion:completion) : showLoginScreen(modaltransitionStyle: .CrossDissolve, dismissToHomePage:true)

    }

}

