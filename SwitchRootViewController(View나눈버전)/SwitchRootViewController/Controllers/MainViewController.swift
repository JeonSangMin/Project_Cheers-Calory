//
//  MainViewController.swift
//  CheersCalory
//
//  Created by MyMac on 2020/03/03.
//  Copyright © 2020 sandMan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
private let label = UILabel()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        label.textAlignment = .center
        label.text = "메인뷰"
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
