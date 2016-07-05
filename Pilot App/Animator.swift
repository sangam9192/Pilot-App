//
//  Animator.swift
//  Pilot App
//
//  Created by Sangam KS on 05/07/16.
//  Copyright © 2016 Sangam. All rights reserved.
//

import UIKit

class Animator : NSObject, UIViewControllerAnimatedTransitioning{

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?)-> NSTimeInterval {
        return 1
    }
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        let toVC = transitionContext.viewControllerForKey(
            UITransitionContextToViewControllerKey)
        
        containerView!.addSubview(toVC!.view)
        toVC!.view.alpha = 1.0
        
        let duration = transitionDuration(transitionContext)
        UIView.animateWithDuration(duration, animations: {
            toVC!.view.alpha = 1.0
            }, completion: { finished in
                let cancelled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!cancelled)
        })
    }
}
