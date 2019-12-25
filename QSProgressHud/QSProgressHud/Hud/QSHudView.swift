//
//  QSHudView.swift
//  TestSwift
//
//  Created by Song on 2018/5/3.
//  Copyright © 2018年 Song. All rights reserved.
//

import UIKit

class QSHudView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.addSubview(toastView)
        toastView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.top.left.greaterThanOrEqualTo(50.0)
            make.right.bottom.lessThanOrEqualTo(-50.0)
        }
        
        toastView.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.top.equalTo(15.0)
            make.centerX.equalToSuperview()
            make.left.greaterThanOrEqualTo(15.0)
            make.right.lessThanOrEqualTo(-15.0)
            make.bottom.lessThanOrEqualTo(-15.0)
        }
        
        toastView.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.left.equalTo(15.0)
            make.right.bottom.equalTo(-15.0)
            make.top.equalTo(imgView.snp_bottom).offset(15.0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.imgView.layer.removeAnimation(forKey: "transform.rotation.z")
    }
    
    // MARK: - Func
    /// 旋转动画
    private func qs_addRotationAnimation(to view: UIView) {
        // 创建动画
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        
        // 设置动画的属性
        rotationAnim.fromValue = 0
        rotationAnim.toValue = Double.pi * 2
        rotationAnim.repeatCount = MAXFLOAT
        rotationAnim.duration = 1.2
        // 这个属性很重要 如果不设置当页面运行到后台再次进入该页面的时候 动画会停止
        rotationAnim.isRemovedOnCompletion = false
        
        // 将动画添加到layer中
        view.layer.add(rotationAnim, forKey: nil)
    }
    
    /// 停止旋转
    private func qs_stopRotationAnimation(in view: UIView) {
        view.layer.removeAllAnimations()
    }
    
    // MARK: - Property
    // 是否需要遮罩
    var isNeedMaskLayer: Bool = true {
        didSet {
            toastView.snp.remakeConstraints { (make) in
                if isNeedMaskLayer {
                    make.center.equalTo(self)
                    make.top.left.greaterThanOrEqualTo(50.0)
                    make.right.bottom.lessThanOrEqualTo(-50.0)
                } else {
                    make.edges.equalToSuperview()
                }
            }
            
            if !isNeedMaskLayer {
                self.layer.cornerRadius = toastRadius
                self.layer.masksToBounds = true
            } else {
                self.layer.cornerRadius = 0.0
                self.layer.masksToBounds = true
            }
        }
    }
    
    // 吐司颜色
    var toastColor: UIColor = .white {
        didSet {
            toastView.backgroundColor = toastColor
        }
    }
    
    // 吐司圆角
    var toastRadius: CGFloat = 0.0 {
        didSet {
            toastView.layer.cornerRadius = toastRadius
            toastView.layer.masksToBounds = true
            
            if !isNeedMaskLayer {
                self.layer.cornerRadius = toastRadius
                self.layer.masksToBounds = true
            } else {
                self.layer.cornerRadius = 0.0
                self.layer.masksToBounds = true
            }
        }
    }
    
    // 文字内容
    var title: String = "" {
        didSet {
            titleLab.text = title
            
            titleLab.snp.updateConstraints { (make) in
                if title.isEmpty {
                    make.top.equalTo(imgView.snp_bottom).offset(0.0)
                } else {
                    make.top.equalTo(imgView.snp_bottom).offset(15.0)
                }
            }
        }
    }
    
    // title字体颜色
    var titleColor: UIColor = UIColor.black {
        didSet {
            titleLab.textColor = titleColor
        }
    }
    
    // title字体大小
    var titleFont: UIFont = UIFont.systemFont(ofSize: 17.0) {
        didSet {
            titleLab.font = titleFont
        }
    }
    
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
                    make.left.greaterThanOrEqualTo(15.0)
                    make.right.lessThanOrEqualTo(-15.0)
                    make.bottom.lessThanOrEqualTo(-15.0)
                    make.height.equalTo(0.0)
                } else {
                    make.top.equalTo(15.0)
                    make.centerX.equalToSuperview()
                    make.left.greaterThanOrEqualTo(15.0)
                    make.right.lessThanOrEqualTo(-15.0)
                    make.bottom.lessThanOrEqualTo(-15.0)
                }
            }
        }
    }
    
    // 图片是否旋转
    var isImgRotate: Bool = false {
        didSet {
            if isImgRotate {
                self.qs_addRotationAnimation(to: imgView)
            } else {
                self.qs_stopRotationAnimation(in: imgView)
            }
        }
    }
    
    // MARK: - Widget
    private lazy var toastView: UIView = {
        let view = UIView.init()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var imgView: UIImageView = {
        let imgV = UIImageView.init()
        return imgV
    }()
    
    private lazy var titleLab: UILabel = {
        let lab = UILabel.init()
        lab.textColor = titleColor
        lab.font = titleFont
        lab.textAlignment = .center
        lab.numberOfLines = 0
        return lab
    }()
}
