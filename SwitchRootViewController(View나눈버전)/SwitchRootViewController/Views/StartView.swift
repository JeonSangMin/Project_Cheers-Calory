//
//  StartView.swift
//  SwitchRootViewController
//
//  Created by MyMac on 2020/03/03.
//  Copyright © 2020 sandMan. All rights reserved.
//

import UIKit

protocol StartViewDelegate: class {
    func inputComplete(_ sender: UIButton)
}

class StartView: UIView {
    weak var delegate: StartViewDelegate?
    
    private let iAmLbl = UILabel()
    private let genderSeg = UISegmentedControl(items: ["남자", "여자"])
    private let birthLbl = UILabel()
    private let birthTf = UITextField()
    private let infoLbl = UILabel()
    private let nextBtn = UIButton()
    
    private let userDefault = UserDefaults.standard
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        self.birthTf.setInputViewDatePicker(target: self, selector: #selector(tapDone))
//        textField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        let uiArr = [iAmLbl, genderSeg, birthLbl, birthTf, infoLbl, nextBtn]
        uiArr.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        iAmLbl.text = "저는요"
        iAmLbl.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        iAmLbl.textAlignment = .center
        
        genderSeg.selectedSegmentIndex = 1
        genderSeg.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .ultraLight)], for: .normal)
        genderSeg.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .light),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ], for: .selected)
        genderSeg.layer.borderWidth = 1
        genderSeg.layer.borderColor = UIColor.black.cgColor
        genderSeg.selectedSegmentTintColor =  #colorLiteral(red: 0.4941176471, green: 0.2235294118, blue: 0.9843137255, alpha: 1) // 126, 57, 251
        genderSeg.layer.addBorder([.all], color: .black, width: 1)
        genderSeg.addTarget(self, action: #selector(switchGender(_:)), for: .valueChanged)

        birthLbl.text = "생년월일은"
        birthLbl.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        birthLbl.textAlignment = .center
        
        birthTf.font = UIFont.systemFont(ofSize: 25, weight: .ultraLight)
        birthTf.textAlignment = .center
        birthTf.layer.borderWidth = 1
        birthTf.layer.borderColor = UIColor.black.cgColor
        
        infoLbl.text = "이를 토대로 정확한 칼로리 목표가 계산됩니다."
        infoLbl.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
        infoLbl.textAlignment = .center
        
        nextBtn.setTitle("다음", for: .normal)
        nextBtn.backgroundColor = #colorLiteral(red: 0.4941176471, green: 0.2235294118, blue: 0.9843137255, alpha: 1)
        nextBtn.setTitleColor(.white, for: .normal)
        nextBtn.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .light)
        nextBtn.addTarget(self, action: #selector(goNext(_:)), for: .touchUpInside)
        
        setConstraints()
    }
    
    private func setConstraints() {
        let guide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            iAmLbl.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            iAmLbl.topAnchor.constraint(equalTo: guide.topAnchor, constant: 50),
            iAmLbl.widthAnchor.constraint(equalToConstant: 200),
            iAmLbl.heightAnchor.constraint(equalToConstant: 50),
            
            genderSeg.topAnchor.constraint(equalTo: iAmLbl.bottomAnchor, constant: 10),
            genderSeg.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            genderSeg.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30),
            genderSeg.heightAnchor.constraint(equalToConstant: 50),
            
            birthLbl.topAnchor.constraint(equalTo: genderSeg.bottomAnchor, constant: 100),
            birthLbl.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            birthLbl.widthAnchor.constraint(equalToConstant: 200),
            birthLbl.heightAnchor.constraint(equalToConstant: 50),
            
            birthTf.topAnchor.constraint(equalTo: birthLbl.bottomAnchor, constant: 10),
            birthTf.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            birthTf.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30),
            birthTf.heightAnchor.constraint(equalToConstant: 50),
            
            infoLbl.topAnchor.constraint(equalTo: birthTf.bottomAnchor, constant: 10),
            infoLbl.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            infoLbl.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.7),
            
            nextBtn.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            nextBtn.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            nextBtn.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30),
            nextBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc private func switchGender(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("남자"); break
        case 1:
            print("여자"); break
        default:
            break
        }
    }
    
    @objc private func goNext(_ sender: UIButton) {
        delegate?.inputComplete(sender)
    }
    
    @objc private func tapDone() {
        if let datePicker = self.birthTf.inputView as? UIDatePicker { // 2-1
            let dateformatter = DateFormatter() // 2-2
            dateformatter.dateFormat = "YYYY년 M월 d일" // 2-3
            self.birthTf.text = dateformatter.string(from: datePicker.date) //2-4
        }
        self.birthTf.resignFirstResponder() // 2-5
    }
    
}

// 정보 입력 끝나면 rootViewController Change
//extension StartView:UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        let tfStr: String? = textField.text
//        UserDefaults.standard.set(tfStr, forKey: "text")
//        setRootView(window: appDelegate.window!)
//        return true
//    }
//}
