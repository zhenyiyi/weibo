//
//  MainViewController.swift
//  WeiboSwift
//
//  Created by fenglin on 2016/10/2.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    let composeButton = UIButton(imageNamed: "tabbar_compose_icon_add", backgroundImageNamed: "tabbar_compose_button");
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComposeButton();
    }
    
    private func setupComposeButton(){
        self.tabBar.addSubview(composeButton);
        composeButton.center = CGPoint(x: self.tabBar.center.x, y: self.tabBar.bounds.size.height * 0.5);
        composeButton.addTarget(self, action: #selector(MainViewController.composeClisk), for: .touchUpInside);
    }
    
    func composeClisk() {
        print("composeClisk");
    }
    
}
