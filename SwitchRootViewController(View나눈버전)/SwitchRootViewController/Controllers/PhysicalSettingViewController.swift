//
//  PhysicalSettingViewController.swift
//  SwitchRootViewController
//
//  Created by MyMac on 2020/03/04.
//  Copyright © 2020 sandMan. All rights reserved.
//

import UIKit

class PhysicalSettingViewController: UIViewController {
    private let height = 0
    private let weight = 0
    
    override func viewDidLoad() {
        let physicalView = PhysicalSettingView(frame: view.frame)
        super.viewDidLoad()
        
        self.view = physicalView
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
}
