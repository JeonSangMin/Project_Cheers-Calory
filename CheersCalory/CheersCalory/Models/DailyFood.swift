//
//  DailyFood.swift
//  CheersCalory
//
//  Created by MyMac on 2020/03/11.
//  Copyright © 2020 sandMan. All rights reserved.
//

import Foundation

struct DailyFood {
    static var shared = DailyFood()
    private init() {}
    
    var breakfast: [Food] = [] { didSet { UserDefaults.standard.set(try? JSONEncoder().encode(breakfast), forKey: "breakfast") }}
    var lunch: [Food] = [] { didSet { UserDefaults.standard.set(try? JSONEncoder().encode(lunch), forKey: "lunch") }}
    var dinner: [Food] = [] { didSet { UserDefaults.standard.set(try? JSONEncoder().encode(dinner), forKey: "dinner") }}
    var snack: [Food] = [] { didSet { UserDefaults.standard.set(try? JSONEncoder().encode(snack), forKey: "snack") }}
}
