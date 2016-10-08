//
//  UIButton+Extension.swift
//  WeiboSwift
//
//  Created by fenglin on 2016/10/4.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(imageNamed imageName: String ,backgroundImageNamed bgImageName: String) {
        self.init();
        setImage(UIImage(named: imageName), for: .normal);
        setImage(UIImage(named: imageName + "highlighted"), for: .highlighted);
        setBackgroundImage(UIImage(named: bgImageName), for: .normal);
        setBackgroundImage(UIImage(named: bgImageName + "highlighted"), for: .highlighted);
        sizeToFit();
    }
}
