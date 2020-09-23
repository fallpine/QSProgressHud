//
//  ViewController.swift
//  QSProgressHud
//
//  Created by Song on 2019/7/29.
//  Copyright © 2019 Song. All rights reserved.
//

import UIKit
import Kingfisher

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
        
        let gifBtn = UIButton.init()
        gifBtn.setTitle("gif", for: .normal)
        gifBtn.setTitleColor(.blue, for: .normal)

        view.addSubview(gifBtn)
        gifBtn.snp.makeConstraints { (make) in
            make.top.equalTo(infoBtn.snp.bottom).offset(35.0)
            make.centerX.equalToSuperview()
        }

        gifBtn.addTarget(self, action: #selector(self.showGif), for: .touchUpInside)

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
        QSProgressHud.shared.qs_showProgress(isMask: false, title: "progress")
    }
    
    @objc private func showSuccess() {
        QSProgressHud.shared.qs_showSuccess(isMask: false, title: "showSuccess") {
            print("success view dismiss")
        }
    }
    
    @objc private func showFailure() {
        QSProgressHud.shared.qs_showError(isMask: true, title: "showFailure", interval: 3.0) {
            print("failure view dismiss")
        }
    }
    
    @objc private func showInfo() {
        QSProgressHud.shared.qs_showText(isMask: true, title: "showInfoshowInfoshowInfoshowInfoshowInfoshowInfoshowInfoshowInfo", interval: 1.5) {
            print("info view dismiss")
        }
    }
    
    @objc private func showGif() {
//        if let path = Bundle.main.path(forResource: "hud_loading", ofType:"gif") {
//            let url = URL.init(fileURLWithPath: path)
//
//            QSProgressHud.shared.qs_showGif(gifUrl: url, isLocalGif: true, isMask: true, title: "") {
//                print("gif view dismiss")
//            }
//        }
        
        if let url = URL.init(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600843313808&di=0c4c1938cea48641e87da221d1a266da&imgtype=0&src=http%3A%2F%2Fcms-bucket.nosdn.127.net%2Fcatchpic%2F6%2F66%2F66d220bc87b442f90205d8aa50bd6bf4.gif%3FimageView%26thumbnail%3D550x0%26tostatic%3D0") {
            QSProgressHud.shared.qs_showGif(gifUrl: url, isLocalGif: false, isMask: true, title: "gif图片") {
                print("gif view dismiss")
            }
        }
    }
    
    @objc private func dismissView() {
        QSProgressHud.shared.qs_dismiss()
    }
}

