//
//  LoginInteractor.swift
//  WeiboSwift
//
//  Created by fenglin on 2016/10/4.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

class LoginInteractor: NSObject {
    
    static let shareInstance : LoginInteractor = {
        return LoginInteractor();
    }();
    
    var isLogined : Bool {
        return true;
    };
    
    func login() -> Bool {
        return false;
    }
}
