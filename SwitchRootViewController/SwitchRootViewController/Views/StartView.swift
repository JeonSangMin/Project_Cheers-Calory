//
//  StartView.swift
//  SwitchRootViewController
//
//  Created by MyMac on 2020/03/03.
//  Copyright © 2020 sandMan. All rights reserved.
//

import UIKit

protocol StartViewDelegate: class {
    func inputComplete(_ sender: UIButton)
}

class StartView: UIView {
    weak var delegate: StartViewDelegate?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
//        textField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

// 정보 입력 끝나면 rootViewController Change
//extension StartView:UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        let tfStr: String? = textField.text
//        UserDefaults.standard.set(tfStr, forKey: "text")
//        setRootView(window: appDelegate.window!)
//        return true
//    }
//}
