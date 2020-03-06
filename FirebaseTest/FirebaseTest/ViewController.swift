//
//  ViewController.swift
//  FirebaseTest
//
//  Created by MyMac on 2020/03/05.
//  Copyright © 2020 sandMan. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    
    let jsonData = readJSONFromFile(fileName: "foods")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ref = Database.database().reference()
        //        let itemRef = self.ref.child("foods")
        //        itemRef.setValue(codable())
        //        searchFood()
        //        codable()
        
//        ref.child("foods").queryOrdered(byChild: "김치").queryEqual(toValue: true).observe(.childAdded, with: {
//            DataSnapshot in
//            print(DataSnapshot.key)
//        })
        
        // 콜백함수가 뭔데 ㅜㅜ
        // 없는거 처리
        // 여차하면 fireStore
        ref.child("foods").queryOrderedByKey().queryStarting(atValue: "김치").observe(.childAdded, with: { (DataSnapshot) in
            guard let value = DataSnapshot.value as? NSDictionary else { print("검색 결과를 찾을 수 없습니다."); return }
            if DataSnapshot.key.contains("김치") {
                print(DataSnapshot.key)
                print(value["1회제공량(g)"] ?? "")
            } else {
//                print("문데")
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        
//                ref.child("foods").child("스테이크").observe(.value, with: { (DataSnapshot) in
//                    guard let value = DataSnapshot.value as? NSDictionary else { print("검색 결과를 찾을 수 없습니다."); return }
//                    print(DataSnapshot.key)
//                    print(value["1회제공량(g)"] ?? "")
//                }) { (error) in
//                    print(error.localizedDescription)
//                }
    }
    
    func jsonToNSData(json: AnyObject) -> NSData?{
        do {
            return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil;
    }
    
    //    func codable() -> [String: [String:String]] {
    //        var dic = [String: [String:String]]()
    //
    //        if let food = try? JSONDecoder().decode(HundredGram.self, from: jsonData) {
    //            for i in food.gram {
    //                dic.updateValue(
    //                    ["1회제공량(g)":i.servingSize,
    //                    "칼로리(kcal)":i.calory,
    //                    "탄수화물(g)":i.carbohydrate,
    //                    "단백질(g)":i.protein,
    //                    "지방(g)":i.fat],
    //                    forKey: i.foodName)
    //            }
    //        } else {
    //            print("왜 안됨")
    //        }
    //        return dic
    //    }
    
    func codable() {
        if let food = try? JSONDecoder().decode(HundredGram.self, from: jsonData) {
            for i in food.gram {
                self.ref.child("foods").child(i.foodName).setValue([
                    "1회제공량(g)":i.servingSize,
                    "칼로리(kcal)":i.calory,
                    "탄수화물(g)":i.carbohydrate,
                    "단백질(g)":i.protein,
                    "지방(g)":i.fat
                ])
            }
        } else {
            print("왜 안됨")
        }
    }
    
    static func readJSONFromFile(fileName: String) -> Data {
        var jsonData: Data?
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                jsonData = data
                //                json = try? JSONSerialization.jsonObject(with: data) as? Data
            } catch {
                print(error)
            }
        }
        return jsonData!
    }
    
    //    func searchFood() {
    //        ref.child("foods").child(<#T##pathString: String##String#>)
    //    }
    
}



