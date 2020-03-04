//
//  PhysicalSettingView.swift
//  SwitchRootViewController
//
//  Created by MyMac on 2020/03/04.
//  Copyright © 2020 sandMan. All rights reserved.
//

import UIKit

class PhysicalSettingView: UIView {
    
    private let heightLbl = UILabel()
    private let heightTF = UITextField()
    private let weightLbl = UILabel()
    private let weightTf = UITextField()
    private let infoLbl = UILabel()
    private let completeBtn = UIButton()
    
    private let userDefault = UserDefaults.standard
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUI()
        heightTF.delegate = self
        weightTf.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        let uiArr = [heightLbl, heightTF, weightLbl, weightTf, infoLbl, completeBtn]
        uiArr.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        heightLbl.text = "제 키는"
        heightLbl.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        heightLbl.textAlignment = .center
        
        heightTF.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        heightTF.textAlignment = .center
        heightTF.layer.borderWidth = 1
        heightTF.layer.borderColor = UIColor.black.cgColor
        
        weightLbl.text = "체중은요"
        weightLbl.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        weightLbl.textAlignment = .center
        
        weightTf.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        weightTf.textAlignment = .center
        weightTf.layer.borderWidth = 1
        weightTf.layer.borderColor = UIColor.black.cgColor
        
        infoLbl.text = ""
        infoLbl.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
        infoLbl.textAlignment = .center
        
        completeBtn.setTitle("완료", for: .normal)
        completeBtn.backgroundColor = #colorLiteral(red: 0.4941176471, green: 0.2235294118, blue: 0.9843137255, alpha: 1)
        completeBtn.setTitleColor(.white, for: .normal)
        completeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .light)
        
        setConstraints()
    }
    
    private func setConstraints() {
        let guide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            heightLbl.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            heightLbl.topAnchor.constraint(equalTo: guide.topAnchor, constant: 50),
            heightLbl.widthAnchor.constraint(equalToConstant: 200),
            heightLbl.heightAnchor.constraint(equalToConstant: 50),
            
            heightTF.topAnchor.constraint(equalTo: heightLbl.bottomAnchor, constant: 10),
            heightTF.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            heightTF.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30),
            heightTF.heightAnchor.constraint(equalToConstant: 50),
            
            weightLbl.topAnchor.constraint(equalTo: heightTF.bottomAnchor, constant: 100),
            weightLbl.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            weightLbl.widthAnchor.constraint(equalToConstant: 200),
            weightLbl.heightAnchor.constraint(equalToConstant: 50),
            
            weightTf.topAnchor.constraint(equalTo: weightLbl.bottomAnchor, constant: 10),
            weightTf.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            weightTf.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30),
            weightTf.heightAnchor.constraint(equalToConstant: 50),
            
            infoLbl.topAnchor.constraint(equalTo: weightTf.bottomAnchor, constant: 10),
            infoLbl.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            infoLbl.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.7),
            
            completeBtn.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            completeBtn.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            completeBtn.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30),
            completeBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

