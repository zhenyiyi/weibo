//
//  MessageViewController.swift
//  WeiboSwift
//
//  Created by fenglin on 2016/10/2.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    @IBOutlet var visitorView: OtherVisitorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("MessageViewController");
    }
}


//MARK:- VisitorView Login && Register Extension

extension MessageViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        if !LoginInteractor.shareInstance.isLogined {
            self.view = visitorView;
        }
    }
}
