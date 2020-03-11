//
//  MainViewController.swift
//  FirebaseTest
//
//  Created by MyMac on 2020/03/09.
//  Copyright © 2020 sandMan. All rights reserved.
//
import Firebase
import UIKit

class MainViewController: UIViewController {
//    var ref: DatabaseReference!
    private let label = UILabel()
    private var userInfo = UserInfo.shared
//    let jsonData = readJSONFromFile(fileName: "Barcode")
    private var dao = DAO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.ref = Database.database().reference()
//        ref.child("product").setValue(SaveJsonData())
        view.backgroundColor = .white
        label.textAlignment = .center
        label.text = "메인뷰"
        readUserDefault()
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
//    func SaveJsonData() -> [String: [String:String]] {
//        var dic = [String: [String:String]]()
//
//        if let barcode = try? JSONDecoder().decode([Barcode].self, from: jsonData) {
//            for i in barcode {
//                dic.updateValue(
//                    ["제품명":i.productName,
//                     "상품분류":i.base,
//                     "원산지":i.origin,],
//                    forKey: i.barcode)
//            }
//        } else {
//            print("왜 안됨")
//        }
//        return dic
//    }
    
//    static func readJSONFromFile(fileName: String) -> Data {
//        var jsonData: Data?
//        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
//            do {
//                let fileUrl = URL(fileURLWithPath: path)
//                // Getting data from JSON file using the file URL
//                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
//                jsonData = data
//            } catch {
//                print(error)
//            }
//        }
//        return jsonData!
//    }
    
    
    private func readUserDefault() {
        guard let data = UserDefaults.standard.data(forKey: "userInfo") else { return }
        if let userInfo = try? JSONDecoder().decode(UserInfo.self, from: data) {
            self.userInfo = userInfo
        }
        label.text = "\(userInfo.gender), \(userInfo.age), \(userInfo.height), \(userInfo.weight)"
    }
}
