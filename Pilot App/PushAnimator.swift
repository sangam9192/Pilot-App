//
//  DismissAnimator.swift
//  Pilot App
//
//  Created by Sangam KS on 08/07/16.
//  Copyright © 2016 Sangam. All rights reserved.
//

import UIKit

class PushAnimator:NSObject, UIViewControllerAnimatedTransitioning{
   
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval{
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let containerView = transitionContext.containerView(),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
                return
        }
        
        containerView.addSubview(toVC.view)
        
        let frame = toVC.view.frame
        toVC.view.frame = CGRect(x: frame.origin.x, y: frame.size.height, width: frame.size.width, height: frame.size.height)
        
        let duration = transitionDuration(transitionContext)
        UIView.animateWithDuration(duration, animations: {
            let frame = toVC.view.frame
            print(frame.origin.y)
            toVC.view.frame = CGRect(x: frame.origin.x, y: 0, width: frame.size.width, height: frame.size.height)
            print(toVC.view.frame.origin.y)
            }, completion: { finished in
                let cancelled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!cancelled)
        })
    }
    
}
