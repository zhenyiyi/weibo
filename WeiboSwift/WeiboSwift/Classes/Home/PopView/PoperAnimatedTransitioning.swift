//
//  PoperAnimatedTransitioning.swift
//  WeiboSwift
//
//  Created by fenglin on 2016/10/8.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

class PoperAnimatedTransitioning: NSObject {
    var completion : (_ isPresent : Bool)->Void ;
    var presentedViewFrame = CGRect(x: 0, y: 0, width: 0, height: 0);
    init(animatedCompletion: @escaping (_ isPresent : Bool)-> Void) {
        self.completion = animatedCompletion;
    }
}


extension PoperAnimatedTransitioning :  UIViewControllerTransitioningDelegate{
    // 改变自定义View的尺寸
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?{
        let vc = WBPresentationController(presentedViewController: presented, presenting: presenting);
        vc.presentedViewFrame = self.presentedViewFrame;
        return vc;
    }
    // 弹出动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self;
    }
    // 消息动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        return self;
    }

}

extension PoperAnimatedTransitioning : UIViewControllerAnimatedTransitioning{
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 0.25;
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning){
        
        // UITransitionContextFromViewKey, and UITransitionContextToViewKey
        // UITransitionContextToViewKey   弹出的view
        // UITransitionContextFromViewKey 消失的view
        
        if let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to){
            
            // 1. 添加View；
            transitionContext.containerView.addSubview(presentedView);
            // 2. 添加动画；
            presentedView.transform = CGAffineTransform(scaleX: 1.0, y: 0);
            //   设置锚点
            presentedView.layer.anchorPoint = CGPoint(x: 0.5, y: 0);
            
            UIView.animate(withDuration:self.transitionDuration(using: transitionContext) , animations: {
                presentedView.transform = CGAffineTransform.identity;
            }) { (finished: Bool) in
                transitionContext.completeTransition(true);
                self.completion(true);
            };
            
        }else if let dismissView = transitionContext.view(forKey: UITransitionContextViewKey.from) {
            
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
                dismissView.transform = CGAffineTransform(scaleX: 1.0, y: 0.00001);
                }, completion: { (finished) in
                    dismissView.removeFromSuperview();
                    transitionContext.completeTransition(true);
                    self.completion(false);
            })
        }
        
        
        
        
        
    }
}
