//
//  TitileButton.swift
//  WeiboSwift
//
//  Created by fenglin on 2016/10/4.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

class TitileButton: UIButton {

    override init(frame: CGRect) {
        
        super.init(frame: frame);
        
        setImage(UIImage(named:"navigationbar_arrow_down"), for: .normal);
        setImage(UIImage(named:"navigationbar_arrow_up"), for: .selected);
        sizeToFit();
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        self.titleLabel?.frame.origin.x = 0;
        self.imageView?.frame.origin.x = (self.titleLabel?.frame.size.width)! + 8;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
