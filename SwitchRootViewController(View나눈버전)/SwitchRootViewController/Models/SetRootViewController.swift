//
//  SetRootViewController.swift
//  SwitchRootViewController
//
//  Created by MyMac on 2020/03/03.
//  Copyright © 2020 sandMan. All rights reserved.
//

import Foundation
import UIKit

func setRootView(window: UIWindow) {
    window.backgroundColor = .white
    
    let tabBarVC = UITabBarController()
    let startVC = UINavigationController(rootViewController: StartViewController())
//    startVC.isNavigationBarHidden = true
    
    let main = MainViewController()
    let daily = DailyViewController()
    let record = RecordViewController()
    
    main.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
    daily.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 1)
    record.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
    
    let tabBarList = [main, daily, record]
    tabBarVC.viewControllers = tabBarList
    
    // 유저디폴트가 있으면 탭바 컨트롤러, 없으면 startVC로
    // startVC에서 입력이 끝나면, rootViewController가 tabBarVC로 바뀜 이때 그냥 바뀌면 밋밋하니까 애니메이션 삽입
    if (UserDefaults.standard.value(forKey: "text") as? String) != nil {
        
        // UIWindowExtension에 정의
        window.switchRootViewController(tabBarVC, animated: true, duration: 0.5, options: .transitionCrossDissolve, completion: nil)
    } else {
        window.rootViewController = startVC
    }
    
    window.makeKeyAndVisible()
}
