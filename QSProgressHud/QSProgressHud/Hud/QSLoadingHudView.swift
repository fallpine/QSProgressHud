//
//  QSLoadingHudView.swift
//  QSProgressHud
//
//  Created by Song on 2020/9/22.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class QSLoadingHudView: QSImageAndTitleHudView {
    // MARK: - Func
    /// 旋转动画
    private func startRotationAnimation(with view: UIView) {
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
    private func stopRotationAnimation(with view: UIView) {
        view.layer.removeAllAnimations()
    }
    
    // 图片是否旋转
    var isImgRotate: Bool = false {
        didSet {
            if isImgRotate {
                startRotationAnimation(with: imgView)
            } else {
                stopRotationAnimation(with: imgView)
            }
        }
    }
}
