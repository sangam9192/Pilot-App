//
//  DismissAnimator.swift
//  Pilot App
//
//  Created by Sangam KS on 08/07/16.
//  Copyright © 2016 Sangam. All rights reserved.
//

import UIKit

class DismissAnimator:NSObject, UIViewControllerAnimatedTransitioning{
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval{
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let containerView = transitionContext.containerView(),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
                return
        }
        
        containerView.addSubview(toVC.view)
        
        let duration = transitionDuration(transitionContext)
        UIView.animateWithDuration(duration,animations: {
            let frame = fromVC.view.frame
            containerView.bringSubviewToFront(fromVC.view)
            fromVC.view.frame = CGRect(x: frame.origin.x, y:frame.size.height, width: frame.size.width, height: frame.size.height)
            }, completion: { finished in
                let cancelled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!cancelled)
        })
    }
    
}
