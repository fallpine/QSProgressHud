//
//  QSImageAndTitleHudView.swift
//  QSProgressHud
//
//  Created by Song on 2020/9/22.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class QSImageAndTitleHudView: QSHudContentView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        toastContentView.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.top.equalTo(12.0)
            make.centerX.equalToSuperview()
            make.left.greaterThanOrEqualTo(12.0)
            make.right.lessThanOrEqualTo(-12.0)
            make.bottom.lessThanOrEqualTo(-12.0)
        }
        
        toastContentView.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.left.equalTo(12.0)
            make.right.bottom.equalTo(-12.0)
            make.top.equalTo(imgView.snp_bottom).offset(12.0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Func
    /// 设置文字
    /// - Parameters:
    ///   - text: 文字
    ///   - font: 字体
    ///   - color: 颜色
    func setTitle(text: String, font: UIFont, color: UIColor) {
        titleLab.text = text
        titleLab.textColor = color
        titleLab.font = font
        
        titleLab.snp.updateConstraints { (make) in
            if text.isEmpty {
                make.top.equalTo(imgView.snp_bottom).offset(0.0)
            } else {
                make.top.equalTo(imgView.snp_bottom).offset(12.0)
            }
        }
    }
    
    // MARK: - Property
    // 图片(仅支持本地图片)
    var iconImg: String = "" {
        didSet {
            if iconImg.hasPrefix("QSProgressHudBundle.bundle/") {
                let name = iconImg.replacingOccurrences(of: "QSProgressHudBundle.bundle/", with: "")
                let path = Bundle(for: QSProgressHud.self).resourcePath! + "/QSProgressHudBundle.bundle"
                let bundle = Bundle(path: path)!
                let img1 = UIImage(named: name, in:  bundle, compatibleWith: nil)
                imgView.image = img1
            } else {
                imgView.image = UIImage.init(named: iconImg)
            }
            
            imgView.snp.remakeConstraints { (make) in
                if iconImg.isEmpty {
                    make.top.equalToSuperview()
                    make.centerX.equalToSuperview()
                    make.left.greaterThanOrEqualTo(12.0)
                    make.right.lessThanOrEqualTo(-12.0)
                    make.bottom.lessThanOrEqualTo(-12.0)
                    make.height.equalTo(0.0)
                } else {
                    make.top.equalTo(12.0)
                    make.centerX.equalToSuperview()
                    make.left.greaterThanOrEqualTo(12.0)
                    make.right.lessThanOrEqualTo(-12.0)
                    make.bottom.lessThanOrEqualTo(-12.0)
                }
            }
        }
    }
    
    // MARK: - Widget
    lazy var imgView: UIImageView = {
        let imgV = UIImageView.init()
        return imgV
    }()
    
    private lazy var titleLab: UILabel = {
        let lab = UILabel.init()
        lab.textColor = .black
        lab.font = UIFont.systemFont(ofSize: 14.0)
        lab.textAlignment = .center
        lab.numberOfLines = 0
        return lab
    }()
}
