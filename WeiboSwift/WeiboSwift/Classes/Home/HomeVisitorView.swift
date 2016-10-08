//
//  HomeVisitorView.swift
//  WeiboSwift
//
//  Created by fenglin on 2016/10/4.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

class HomeVisitorView: UIView {

    @IBOutlet weak var focusButton: UIButton!
    @IBOutlet weak var animatedImageView: UIImageView!
    
    func startAnimation(){
        let animation =  CABasicAnimation(keyPath: "transform.rotation.z");
        animation.fromValue = 0;
        animation.toValue = M_PI * 2;
        animation.duration = 10;
        animation.isRemovedOnCompletion = false;
        animatedImageView.layer.add(animation, forKey: nil);
    }
}
