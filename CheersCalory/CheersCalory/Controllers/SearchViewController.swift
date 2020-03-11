//
//  RecordViewController.swift
//  FirebaseTest
//
//  Created by MyMac on 2020/03/09.
//  Copyright © 2020 sandMan. All rights reserved.
//

import UIKit
import Firebase

protocol SendBarcodeDataDelegate {
    func sendBarcodeData(barcode: String)
}

class FoodSearchViewController: UIViewController {
    var section = 0
    
    private let dao = DAO()
    
    private var delegate: SendBarcodeDataDelegate?
    private var ref: DatabaseReference!
    
    private let label = UILabel()
    private let searchController = UISearchController(searchResultsController: nil)
    private let tableView = UITableView()
    private var dataArr:[Food] = []
    
    private var filteredDatas: [Food] = []
    private var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    private var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference()
        view.backgroundColor = .white
        
        print(self.section)
        
        // 유저디폴트 생성 -> decode해서 해당 데이터 배열에 저장
        dao.search()
        setFoodDatas()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "음식을 검색하세요"
        
        definesPresentationContext = true
        
        setNavigationBar()
        setUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        guard let tabbar = self.presentingViewController as? UITabBarController else { return print("0000") }
//        guard let navi = tabbar.viewControllers?[1] as? UINavigationController else {return print("1111")}
//        guard let dailyVC = navi.viewControllers.first as? DailyViewController else { return print("222")}
//
//        super.viewWillDisappear(animated)
////        dailyVC.tableView.reloadData()
//        if let x = UserDefaults.standard.object(forKey: "breakfast") as? Data {
//            if let loaded = try? JSONDecoder().decode([Food].self, from: x) {
//                dailyVC.breakfast = loaded
//                dailyVC.tableView.reloadData()
//            }
//        }
        //        guard let tabbar = self.presentingViewController as? UITabBarController else { return print("0000") }
        //        guard let navi = tabbar.viewControllers?[1] as? UINavigationController else {return print("1111")}
        //        guard let dailyVC = navi.viewControllers.first as? DailyViewController else { return print("222")}
        //
        //        UserDefaults.standard.setStructArray(dailyVC.breakfast, forKey: "breakfast")
        //        UserDefaults.standard.setStructArray(dailyVC.lunch, forKey: "lunch")
        //        UserDefaults.standard.setStructArray(dailyVC.dinner, forKey: "dinner")
        //        UserDefaults.standard.setStructArray(dailyVC.snack, forKey: "snack")
    }
    
    private func setFoodDatas() {
        if let savedFoodDatas = UserDefaults.standard.object(forKey: "foodDatas") as? Data {
            let decoder = JSONDecoder()
            if let loadedFoods = try? decoder.decode([Food].self, from: savedFoodDatas) {
                self.dataArr = loadedFoods
            }
        }
        
    }
    
    func filterContentForSearchText(searchText: String) {
        filteredDatas = dataArr.filter { (food: Food) -> Bool in
            return food.foodName.contains(searchText)
        }
        tableView.reloadData()
    }
    
    private func setUI() {
        setConstraints()
    }
    
    private func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
    
    private func setNavigationBar() {
        navigationItem.title = "검색"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "lessthan"), style: .plain, target: self, action: #selector(goBack(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "barcode"), style: .plain, target: self, action: #selector(tapBarcodeBtn(_:)))
        navigationItem.searchController = searchController
        
    }
    
    @objc private func tapBarcodeBtn(_ sender: UIBarButtonItem) {
        let camVC = CameraViewController()
        camVC.delegate = self
        present(camVC, animated: true)
        
    }
    
    @objc private func goBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    func barcodeSearching(barcode: String) {
        guard let tabbar = self.presentingViewController as? UITabBarController else { return print("0000") }
        guard let navi = tabbar.viewControllers?[1] as? UINavigationController else {return print("1111")}
        guard let dailyVC = navi.viewControllers.first as? DailyViewController else { return print("222")}
        ref.child("product").child(barcode).observeSingleEvent(of: .value, with: {( DataSnapshot) in
            let value = DataSnapshot.value as? NSDictionary
            dailyVC.navigationItem.title = value?["제품명"] as? String ?? "데이터가 없습니다"
            print(value?["원산지"] as? String ?? "노데이터")
            print(value?["상품분류"] as? String ?? "노데이터")
            print(value?["제품명"] as? String ?? "노데이터")
            // 여기서 섹션별로
//            let food: Food
//            switch self.section {
//            case 0: DailyFood.shared.breakfast.append(food)
//            case 1: DailyFood.shared.lunch.append(food)
//            case 2: DailyFood.shared.dinner.append(food)
//            case 3: DailyFood.shared.snack.append(food)
//            default: print("안됨")
//            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}

extension FoodSearchViewController: SendBarcodeDataDelegate {
    func sendBarcodeData(barcode: String) {
        barcodeSearching(barcode: barcode)
    }
}

extension FoodSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredDatas.count
        }
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        let food: Food
        
        if isFiltering {
            food = filteredDatas[indexPath.row]
        } else {
            food = dataArr[indexPath.row]
        }
        cell.textLabel?.text = food.foodName
        return cell
    }
    
}

extension FoodSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //dump(presentingViewController)
        let food: Food
        
        if isFiltering {
            food = filteredDatas[indexPath.row]
        } else {
            food = dataArr[indexPath.row]
        }
        
        switch self.section {
        case 0: DailyFood.shared.breakfast.append(food)
        case 1: DailyFood.shared.lunch.append(food)
        case 2: DailyFood.shared.dinner.append(food)
        case 3: DailyFood.shared.snack.append(food)
        default: print("안됨")
        }
        
        guard let tabbar = self.presentingViewController as? UITabBarController else { return print("0000") }
        guard let navi = tabbar.viewControllers?[1] as? UINavigationController else {return print("1111")}
        guard let dailyVC = navi.viewControllers.first as? DailyViewController else { return print("222")}
        
        dailyVC.tableView.reloadData()
        
        // 검색한 상태에서 선택하면 dismiss를 두 번 해줘야하니깐,
        // presentingView 단에서 dismiss를 하면 됨
        //검색하는 순간에는 그 위에 뷰가 하나 더 깔린거라고 봐야되는 듯
        
        if isFiltering {
            self.presentingViewController?.dismiss(animated: true)
        } else {
            self.dismiss(animated: true)
        }
        print(food)
    }
}

extension FoodSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchText: searchBar.text!)
    }
    
}
