
//
//  RecordViewController.swift
//  SwitchRootViewController
//
//  Created by MyMac on 2020/03/03.
//  Copyright © 2020 sandMan. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {
  
  // MARK: -Property
  private let label = UILabel()
  private let headerView = RecordHeaderView()
  private let graphView = RecordGraphView()
  private let tableView: UITableView = {
    let tableview = UITableView()
    tableview.register(RecordTableViewCell.self, forCellReuseIdentifier: RecordTableViewCell.identifier)
    return tableview
  }()
    

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.isNavigationBarHidden = true
    view.backgroundColor = .white
    tableView.dataSource = self
    tableView.rowHeight = 72
    setupConstraint()
  }
  

  
  // MARK: - setup
  private func setupConstraint() {
    let guide = view.safeAreaLayoutGuide
    [headerView, graphView, tableView].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      headerView.topAnchor.constraint(equalTo: view.topAnchor),
      headerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      headerView.heightAnchor.constraint(equalToConstant: 100)
    ])
    
    NSLayoutConstraint.activate([
      graphView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
      graphView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      graphView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      graphView.heightAnchor.constraint(equalToConstant: 280)
    ])
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: graphView.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    
    ])
    
  }
  
  
}

// MARK: -UITableViewDataSource
extension RecordViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: RecordTableViewCell.identifier, for: indexPath)
    return cell
  }
  
  
}

