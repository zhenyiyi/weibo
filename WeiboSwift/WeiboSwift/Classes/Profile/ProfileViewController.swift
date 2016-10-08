//
//  ProfileViewController.swift
//  WeiboSwift
//
//  Created by fenglin on 2016/10/4.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var visitorView: OtherVisitorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}



extension ProfileViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        if !LoginInteractor.shareInstance.isLogined {
            self.view = visitorView;
        }
    }
}
