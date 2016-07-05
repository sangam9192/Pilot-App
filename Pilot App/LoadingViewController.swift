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
        activityView.color = UIColor.orangeColor()
        activityView.center = view.center
        activityView.startAnimating()
        self.view.addSubview(activityView)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        sleep(1)
        let loginViewcontroller:LoginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
        presentViewController(loginViewcontroller, animated: true, completion: {self.activityView.stopAnimating()})
    }
}


