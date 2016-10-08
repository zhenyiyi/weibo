//
//  HomeViewController.swift
//  WeiboSwift
//
//  Created by fenglin on 2016/10/2.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

   @IBOutlet  var visitorView: HomeVisitorView!
    
    lazy var titleButton : TitileButton = TitileButton();
    
    lazy var poperAnimated : PoperAnimatedTransitioning = PoperAnimatedTransitioning {[weak self] (isPresented) in
        self!.titleButton.isSelected = isPresented;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK:- VisitorView Login && Register Extension
extension HomeViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        if !LoginInteractor.shareInstance.isLogined {
            self.view = visitorView;
            visitorView.startAnimation();
            visitorView.focusButton.addTarget(self, action: #selector(HomeViewController.focus), for: .touchUpInside);
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(HomeViewController.register));
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(HomeViewController.login));
        }else {
            //MARK:- Login success 
            
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention");
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop");
            titleButton.setTitle("fenglin", for: .normal);
            titleButton.setTitleColor(UIColor.black, for: .normal);
            titleButton.addTarget(self, action: #selector(HomeViewController.titleButtonClick(_:)), for: .touchUpInside);
            self.navigationItem.titleView = titleButton;
        }
    }
    
    @objc private func focus(){
        print("focus");
    }
    
    @objc private func login(){
        
    }
    @objc private func register(){
        
    }
    
    @objc private func titleButtonClick(_ sender: TitileButton){
        sender.isSelected = !sender.isSelected;
        let popVC = PoperViewController();
        popVC.modalPresentationStyle = .custom;
        poperAnimated.presentedViewFrame = CGRect(x: (UIScreen.main.bounds.size.width - 200) * 0.5, y: 55 , width: 200, height: 300);
        popVC.transitioningDelegate = poperAnimated;
        present(popVC, animated: true, completion: nil);
    }
}






