//
//  UIBarButtonItem+Extension.swift
//  WeiboSwift
//
//  Created by fenglin on 2016/10/4.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    convenience init(imageName: String) {
        let btn = UIButton();
        btn.setImage(UIImage(named : imageName), for: .normal);
        btn.setImage(UIImage(named : imageName + "_highlighted"), for: .highlighted);
        btn.sizeToFit();
        self.init(customView:btn);
    }
}
