//
//  Daily.swift
//  FirebaseTest
//
//  Created by MyMac on 2020/03/10.
//  Copyright © 2020 sandMan. All rights reserved.
//

import Foundation

struct DailyRecord: Codable {
    static var shared = DailyRecord()
    private init() {}
    
    var totalCalory: [Int] = [] {
        didSet { UserDefaults.standard.set(totalCalory, forKey: "totalCalory") }
    }
    

    var date: [String] = [] {
        didSet { UserDefaults.standard.set(date, forKey: "date") }
    }


    var cutLine: [String] = [] {
        didSet { UserDefaults.standard.set(cutLine, forKey: "cutLine") }
    }
    
    
}
