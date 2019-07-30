//
//  QSHudView.swift
//  TestSwift
//
//  Created by Song on 2018/5/3.
//  Copyright © 2018年 Song. All rights reserved.
//

import UIKit

class QSHudView: UIView {
    /// 子控件
    private var imgView: UIImageView!
    
    /// 初始化
    ///
    /// - Parameters:
    ///   - toastViewColor: 吐司颜色
    ///   - toastViewRadius: 吐司圆角
    ///   - img: 图片名（暂时仅支持本地图片）
    ///   - title: 文字提示
    ///   - titleFont: 文字提示字体
    ///   - titleColor: 文字提示颜色
    ///   - isImgRotate: 是否旋转图片
    ///   - isNeedMaskLayer: 是否需要遮罩层
    ///   - complete: 显示完成回调
    convenience init(toastViewColor: UIColor, toastViewRadius: CGFloat?, img: String?, title: String?, titleFont: UIFont, titleColor: UIColor, isImgRotate: Bool, isNeedMaskLayer: Bool, complete: (() -> ())?) {
        self.init(frame: CGRect.zero)
        
        // toastView
        let toastView = UIView.init()
        self.addSubview(toastView)
        toastView.snp.makeConstraints { (make) in
            if isNeedMaskLayer {
                make.center.equalTo(self)
                make.top.left.greaterThanOrEqualTo(50.0)
                make.right.bottom.lessThanOrEqualTo(-50.0)
            } else {
                make.edges.equalTo(UIEdgeInsets.zero)
            }
            
            if let tit = title {
                if !tit.isEmpty {
                    make.width.greaterThanOrEqualTo(180.0)
                }
            }
        }
        
        if isNeedMaskLayer {
            toastView.backgroundColor = toastViewColor
        } else {
            toastView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
        
        if let radius = toastViewRadius {
            toastView.layer.cornerRadius = radius
            toastView.layer.masksToBounds = true
        }
        
        // imgView
        imgView = UIImageView.init()
        toastView.addSubview(imgView)
        imgView.snp.makeConstraints { (make) in
            make.top.equalTo(15.0)
            make.centerX.equalTo(toastView)
            make.left.greaterThanOrEqualTo(15.0)
            make.right.lessThanOrEqualTo(-15.0)
            
            if let tit = title {
                if tit.isEmpty {
                    make.bottom.equalTo(-15.0)
                }
            }
        }
        
        if let imgName = img {
//            imgView.image = UIImage.init(named: imgName)
            imgView.image = UIImage.init(named: imgName, in: Bundle.main, compatibleWith: nil)
        }
        
        // 旋转动画
        if isImgRotate {
            self.qs_addRotationAnimation(toView: imgView)
        }
        
        // titleLab
        let titleLab = UILabel.init()
        toastView.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            if img != nil {
                if title == nil {
                    make.top.equalTo(imgView.snp.bottom)
                } else {
                    make.top.equalTo(imgView.snp.bottom).offset(20.0)
                }
            } else {
                make.top.equalTo(15.0)
            }
            make.left.equalTo(15.0)
            make.right.bottom.equalTo(-15.0)
        }
        
        titleLab.font = titleFont
        if isNeedMaskLayer {
            titleLab.textColor = titleColor
        } else {
            titleLab.textColor = UIColor.white
        }
        titleLab.numberOfLines = 0
        titleLab.textAlignment = .center
        titleLab.text = title
    }
    
    // MARK: - Private Methods
    /// 旋转动画
    private func qs_addRotationAnimation(toView: UIView) {
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
        toView.layer.add(rotationAnim, forKey: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.imgView.layer.removeAnimation(forKey: "transform.rotation.z")
    }
}
