//
//  DailyViewController.swift
//  FirebaseTest
//
//  Created by MyMac on 2020/03/09.
//  Copyright © 2020 sandMan. All rights reserved.
//

import UIKit

class DailyViewController: UIViewController {
    
    // MARK: -Property
    private let headerView = DailyView()
    
    let tableView: UITableView = {
        let tableview = UITableView()
        tableview.tableFooterView = UIView(frame: CGRect.zero)
        tableview.register(DailyTableViewCell.self, forCellReuseIdentifier: DailyTableViewCell.identifier)
        return tableview
    }()
    
//    var breakfast = [Food]()
//    var lunch = [Food]()
//    var dinner = [Food]()
//    var snack = [Food]()
    
    // 오늘 날짜
    private var tempToday = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        
        setupConstraint()
        setDatasource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        saveDailyRecord()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 테스트용
        saveDailyRecord()
    }
    
    // MARK: - Set Autolayout
    private func setupConstraint() {
        let guide = view.safeAreaLayoutGuide
        [headerView, tableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: guide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
    
    // MARK: - Set Daily Records
    private func saveDailyRecord() {
        // 오늘 끝나면 저장 시작
        
        var totalCal: Int = 0
//        let totalCalStr = String(totalCal)
        
        // 하루의 총 칼로리
        let meals = DailyFood.shared.breakfast + DailyFood.shared.lunch + DailyFood.shared.dinner + DailyFood.shared.snack
        
        for i in meals {
            let convertedCalory = i.calory.trimmingCharacters(in: [" "])
            totalCal += Int(convertedCalory) ?? 0
        }
        
        print(dateFormatting())
        print(totalCal)
        // 오버 된 양(나중에)
        
        DailyRecord.shared.totalCalory.append(totalCal)
        DailyRecord.shared.date.append(dateFormatting())
    }
    
    // MARK: - Set DataSource
    private func setDatasource() {
        if let x = UserDefaults.standard.object(forKey: "breakfast") as? Data {
            if let loaded = try? JSONDecoder().decode([Food].self, from: x) {
                dump(loaded)
                DailyFood.shared.breakfast = loaded
            }
        }
        
        if let x = UserDefaults.standard.object(forKey: "lunch") as? Data {
            if let loaded = try? JSONDecoder().decode([Food].self, from: x) {
                dump(loaded)
                DailyFood.shared.lunch = loaded
            }
        }
        
        if let x = UserDefaults.standard.object(forKey: "dinner") as? Data {
            if let loaded = try? JSONDecoder().decode([Food].self, from: x) {
                dump(loaded)
                DailyFood.shared.dinner = loaded
            }
        }
        
        if let x = UserDefaults.standard.object(forKey: "snack") as? Data {
            if let loaded = try? JSONDecoder().decode([Food].self, from: x) {
                dump(loaded)
                DailyFood.shared.snack = loaded
            }
        }
        self.tableView.reloadData()
    }
    
}

// MARK: -UITableViewDataSource
extension DailyViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return DailyFood.shared.breakfast.count
        case 1:
            return DailyFood.shared.lunch.count
        case 2:
            return DailyFood.shared.dinner.count
        case 3:
            return DailyFood.shared.snack.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyTableViewCell.identifier, for: indexPath) as! DailyTableViewCell
        
        var name = ""
        var base = ""
        var calory = ""
        
        switch indexPath.section {
        case 0:
            name = DailyFood.shared.breakfast[indexPath.row].foodName
            base = DailyFood.shared.breakfast[indexPath.row].servingSize
            calory = DailyFood.shared.breakfast[indexPath.row].calory
        case 1:
            name = DailyFood.shared.lunch[indexPath.row].foodName
            base = DailyFood.shared.lunch[indexPath.row].servingSize
            calory = DailyFood.shared.lunch[indexPath.row].calory
        case 2:
            name = DailyFood.shared.dinner[indexPath.row].foodName
            base = DailyFood.shared.dinner[indexPath.row].servingSize
            calory = DailyFood.shared.dinner[indexPath.row].calory
        case 3:
            name = DailyFood.shared.snack[indexPath.row].foodName
            base = DailyFood.shared.snack[indexPath.row].servingSize
            calory = DailyFood.shared.snack[indexPath.row].calory
        default:
            break
        }
        
        cell.foodName.text = name
        cell.foodBase.text = "\(base)(g)"
        cell.foodkcal.text = "\(calory) kcal"
        return cell
    }
    
}

// MARK: - Set TableView
extension DailyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = DailySectionHeaderView()
        view.section = section
        view.backgroundColor = .lightGray
        view.delegate = self
        switch section {
        case 0:
            view.foodLabel.text = "아침" as String
        case 1:
            view.foodLabel.text = "점심" as String
        case 2:
            view.foodLabel.text = "저녁" as String
        case 3:
            view.foodLabel.text = "간식" as String
        default:
            break
        }
        
        return view
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            switch indexPath.section {
            case 0:
                DailyFood.shared.breakfast.remove(at: indexPath.row)
            case 1:
                DailyFood.shared.lunch.remove(at: indexPath.row)
            case 2:
                DailyFood.shared.dinner.remove(at: indexPath.row)
            case 3:
                DailyFood.shared.snack.remove(at: indexPath.row)
            default:
                break
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

// MARK: - Set SectionHeader
extension DailyViewController: DailySectionHeaderViewdelegate {
    func didTapPlusButton(section: Int) {
        
        let foodVC = FoodSearchViewController()
        foodVC.section = section
        let navi = UINavigationController(rootViewController: foodVC)
        present(navi, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let indexPathValue = indexPath
        print(indexPath)
        return indexPathValue
    }
    
}

