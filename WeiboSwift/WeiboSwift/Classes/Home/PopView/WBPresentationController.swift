//
//  WBPresentationController.swift
//  WeiboSwift
//
//  Created by fenglin on 2016/10/8.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

class WBPresentationController: UIPresentationController {
    
    var dismissView : (() -> Void)?
    var presentedViewFrame = CGRect(x: 0, y: 0, width: 0, height: 0);
    //MARK:- 懒加载属性
    lazy var coverView : UIView = UIView();
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews();
        presentedView?.frame = presentedViewFrame;
        setupCoverView();
    }
}

extension WBPresentationController  {
    func setupCoverView() {
        // 1. 添加蒙版，并设置属性
        containerView?.insertSubview(coverView, at: 0);
        coverView.backgroundColor = UIColor(white: 0.8, alpha: 0.5);
        coverView.frame = containerView!.bounds;
        //2. 添加手势
        let tap = UITapGestureRecognizer(target: self, action: #selector(WBPresentationController.coverViewClick(_:)));
        coverView.addGestureRecognizer(tap);
    }
    
    @objc private func coverViewClick(_ sender : UITapGestureRecognizer){
        presentedViewController.dismiss(animated: true, completion: nil);
    }
    
    
}
