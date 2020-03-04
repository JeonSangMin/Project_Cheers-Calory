//
//  StartViewController.swift
//  CheersCalory
//
//  Created by MyMac on 2020/03/03.
//  Copyright © 2020 sandMan. All rights reserved.
//

// endEditing 하는 순간에는 값 저장하고,
// 완료 누르면 유저디폴트에 값 저장

import UIKit

class StartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startView = StartView(frame: view.frame)
        // view를 따로 나눠놨기 때문에 ViewController 깔끔
        startView.delegate = self
        self.view = startView
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
}

extension StartViewController: StartViewDelegate {
    func inputComplete(_ sender: UIButton) {
        let physicalVC = PhysicalSettingViewController()
        navigationController?.pushViewController(physicalVC, animated: true)
    }
}
