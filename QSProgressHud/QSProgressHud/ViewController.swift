//
//  ViewController.swift
//  QSProgressHud
//
//  Created by Song on 2019/7/29.
//  Copyright © 2019 Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let progressBtn = UIButton.init()
        progressBtn.setTitle("show progress", for: .normal)
        progressBtn.setTitleColor(.blue, for: .normal)
        
        view.addSubview(progressBtn)
        progressBtn.snp.makeConstraints { (make) in
            make.top.equalTo(100.0)
            make.centerX.equalToSuperview()
        }
        
        progressBtn.addTarget(self, action: #selector(self.showProgress), for: .touchUpInside)
        
        let successBtn = UIButton.init()
        successBtn.setTitle("show success", for: .normal)
        successBtn.setTitleColor(.blue, for: .normal)
        
        view.addSubview(successBtn)
        successBtn.snp.makeConstraints { (make) in
            make.top.equalTo(progressBtn.snp.bottom).offset(35.0)
            make.centerX.equalToSuperview()
        }
        
        successBtn.addTarget(self, action: #selector(self.showSuccess), for: .touchUpInside)
        
        let failureBtn = UIButton.init()
        failureBtn.setTitle("show failure", for: .normal)
        failureBtn.setTitleColor(.blue, for: .normal)
        
        view.addSubview(failureBtn)
        failureBtn.snp.makeConstraints { (make) in
            make.top.equalTo(successBtn.snp.bottom).offset(35.0)
            make.centerX.equalToSuperview()
        }
        
        failureBtn.addTarget(self, action: #selector(self.showFailure), for: .touchUpInside)
        
        let infoBtn = UIButton.init()
        infoBtn.setTitle("show info", for: .normal)
        infoBtn.setTitleColor(.blue, for: .normal)
        
        view.addSubview(infoBtn)
        infoBtn.snp.makeConstraints { (make) in
            make.top.equalTo(failureBtn.snp.bottom).offset(35.0)
            make.centerX.equalToSuperview()
        }
        
        infoBtn.addTarget(self, action: #selector(self.showInfo), for: .touchUpInside)
        
        let dismissBtn = UIButton.init()
        dismissBtn.setTitle("dismiss", for: .normal)
        dismissBtn.setTitleColor(.blue, for: .normal)
        
        view.addSubview(dismissBtn)
        dismissBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-120.0)
        }
        
        dismissBtn.addTarget(self, action: #selector(self.dismissView), for: .touchUpInside)
    }
    
    // MARK: - Func
    @objc private func showProgress() {
        QSProgressHud.qs_showProgress(toView: nil, title: nil, isNeedMaskLayer: false)
    }
    
    @objc private func showSuccess() {
        QSProgressHud.qs_showSuccess(toView: nil, title: "showSuccess", isNeedMaskLayer: false, dismissInterval: 2.0) {
            print("success view dismiss")
        }
    }
    
    @objc private func showFailure() {
        QSProgressHud.qs_showFailure(toView: nil, title: "showFailure", isNeedMaskLayer: true, dismissInterval: 2.0) {
            print("failure view dismiss")
        }
    }
    
    @objc private func showInfo() {
        QSProgressHud.qs_showInfo(toView: nil, title: "showInfo", isNeedMaskLayer: true, dismissInterval: 2.0) {
            print("info view dismiss")
        }
    }
    
    @objc private func dismissView() {
        QSProgressHud.qs_dismiss()
        QSProgressHud.qs_showSuccess(toView: nil, title: "showSuccess", isNeedMaskLayer: false, dismissInterval: 2.0) {
            print("success view dismiss")
        }
    }
}

