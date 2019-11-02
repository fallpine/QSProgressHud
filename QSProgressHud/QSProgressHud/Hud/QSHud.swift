//
//  QSHud.swift
//  TestSwift
//
//  Created by Song on 2018/5/3.
//  Copyright © 2018年 Song. All rights reserved.
//

import UIKit
import SnapKit

class QSHud: NSObject {
    // 单例
    static var shared: QSHud {
        struct Static {
            static let instance : QSHud = QSHud()
        }
        return Static.instance
    }
    
    // MARK: - Func
    /// 加载中
    ///
    /// - Parameters:
    ///   - toView: 吐司加到哪个view上，nil加到window
    ///   - title: 标题
    ///   - loadingImg: 加载中图片
    ///   - isNeedMaskLayer: 是否需要遮罩
    ///   - maskLayerColor: 遮罩层颜色
    ///   - toastViewColor: 吐司颜色
    ///   - toastViewRadius: 吐司圆角
    ///   - titleColor: 标题颜色
    ///   - titleFont: 标题字体
    func qs_showProgress(toView: UIView? = nil,
                         title: String? = nil,
                         loadingImg: String? = nil,
                         isNeedMaskLayer: Bool = true,
                         maskLayerColor: UIColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5),
                         toastViewColor: UIColor = .white,
                         toastViewRadius: CGFloat = 10.0,
                         titleColor: UIColor = .black,
                         titleFont: UIFont = UIFont.systemFont(ofSize: 17.0)) {
        let img = loadingImg == nil ? loadingImgName : loadingImg
        
        // 引用计数加一
        showCount += 1
        qs_addHudView(toView: toView,
                      img: img,
                      title: title,
                      isNeedMaskLayer: isNeedMaskLayer,
                      isImgRotate: true,
                      maskLayerColor: maskLayerColor,
                      toastViewColor: toastViewColor,
                      toastViewRadius: toastViewRadius,
                      titleColor: titleColor,
                      titleFont: titleFont)
    }
    
    /// 成功
    ///
    /// - Parameters:
    ///   - toView: 吐司加到哪个view上，nil加到window
    ///   - title: 标题
    ///   - successImg: 成功图片
    ///   - isNeedMaskLayer: 是否需要遮罩
    ///   - maskLayerColor: 遮罩颜色
    ///   - toastViewColor: 吐司颜色
    ///   - toastViewRadius: 吐司圆角
    ///   - titleColor: 标题颜色
    ///   - titleFont: 标题字体
    ///   - dismissInterval: 消失时间
    ///   - dismissComplete: 消失后回调
    func qs_showSuccess(toView: UIView? = nil,
                        title: String? = nil,
                        successImg: String? = nil,
                        isNeedMaskLayer: Bool = true,
                        maskLayerColor: UIColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5),
                        toastViewColor: UIColor = .white,
                        toastViewRadius: CGFloat = 10.0,
                        titleColor: UIColor = .black,
                        titleFont: UIFont = UIFont.systemFont(ofSize: 17.0),
                        dismissInterval: TimeInterval = 2.5,
                        dismissComplete: (() -> ())? = nil) {
        let img = successImg == nil ? successImgName : successImg
        
        // 引用计数加一
        showCount += 1
        qs_addHudView(toView: toView,
                      img: img,
                      title: title,
                      isNeedMaskLayer: isNeedMaskLayer,
                      isImgRotate: false,
                      maskLayerColor: maskLayerColor,
                      toastViewColor: toastViewColor,
                      toastViewRadius: toastViewRadius,
                      titleColor: titleColor,
                      titleFont: titleFont)
        
        // 自动消失
        if dismissInterval > 0.0 {
            dismissTask = QSDispatch.qs_delay(dismissInterval) { [weak self] in
                self?.qs_dismiss(complete: dismissComplete)
            }
        }
    }
    
    /// 失败
    ///
    /// - Parameters:
    ///   - toView: 吐司加到哪个view上，nil加到window
    ///   - title: 标题
    ///   - errorImg: 错误图片
    ///   - isNeedMaskLayer: 是否需要遮罩
    ///   - maskLayerColor: 遮罩颜色
    ///   - toastViewColor: 吐司颜色
    ///   - toastViewRadius: 吐司圆角
    ///   - titleColor: 标题颜色
    ///   - titleFont: 标题字体
    ///   - dismissInterval: 消失时间
    ///   - dismissComplete: 消失后回调
    func qs_showError(toView: UIView? = nil,
                      title: String? = nil,
                      errorImg: String? = nil,
                      isNeedMaskLayer: Bool = true,
                      maskLayerColor: UIColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5),
                      toastViewColor: UIColor = .white,
                      toastViewRadius: CGFloat = 10.0,
                      titleColor: UIColor = .black,
                      titleFont: UIFont = UIFont.systemFont(ofSize: 17.0),
                      dismissInterval: TimeInterval = 2.5,
                      dismissComplete: (() -> ())? = nil) {
        let img = errorImg == nil ? errorImgName : errorImg
        
        // 引用计数加一
        showCount += 1
        qs_addHudView(toView: toView,
                      img: img,
                      title: title,
                      isNeedMaskLayer: isNeedMaskLayer,
                      isImgRotate: false,
                      maskLayerColor: maskLayerColor,
                      toastViewColor: toastViewColor,
                      toastViewRadius: toastViewRadius,
                      titleColor: titleColor,
                      titleFont: titleFont)
        
        // 自动消失
        if dismissInterval > 0.0 {
            dismissTask = QSDispatch.qs_delay(dismissInterval) { [weak self] in
                self?.qs_dismiss(complete: dismissComplete)
            }
        }
    }
    
    /// 文字
    ///
    /// - Parameters:
    ///   - toView: 吐司加到哪个view上，nil加到window
    ///   - title: 标题
    ///   - isNeedMaskLayer: 是否需要遮罩
    ///   - maskLayerColor: 遮罩颜色
    ///   - toastViewColor: 吐司颜色
    ///   - toastViewRadius: 吐司圆角
    ///   - titleColor: 标题颜色
    ///   - titleFont: 标题字体
    ///   - dismissInterval: 消失时间
    ///   - dismissComplete: 消失后回调
    func qs_showText(toView: UIView? = nil,
                     title: String,
                     isNeedMaskLayer: Bool = true,
                     maskLayerColor: UIColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5),
                     toastViewColor: UIColor = .white,
                     toastViewRadius: CGFloat = 10.0,
                     titleColor: UIColor = .black,
                     titleFont: UIFont = UIFont.systemFont(ofSize: 17.0),
                     dismissInterval: TimeInterval = 2.5,
                     dismissComplete: (() -> ())? = nil) {
        // 引用计数加一
        showCount += 1
        qs_addHudView(toView: toView,
                      img: nil,
                      title: title,
                      isNeedMaskLayer: isNeedMaskLayer,
                      isImgRotate: false,
                      maskLayerColor: maskLayerColor,
                      toastViewColor: toastViewColor,
                      toastViewRadius: toastViewRadius,
                      titleColor: titleColor,
                      titleFont: titleFont)
        
        // 自动消失
        if dismissInterval > 0.0 {
            dismissTask = QSDispatch.qs_delay(dismissInterval) { [weak self] in
                self?.qs_dismiss(complete: dismissComplete)
            }
        }
    }
    
    /// 消失
    ///
    /// - Parameter complete: 消失后回调
    func qs_dismiss(complete: (() -> ())? = nil) {
        if showCount <= 0 {
            return
        }
        
        showCount -= 1
        if showCount > 0 {
            if let block = complete {
                block()
            }
            return
        }
        
        if dismissTask != nil {
            QSDispatch.qs_cancle(dismissTask)
        }
        
        UIView.animate(withDuration: 0.35, animations: { [weak self] in
            self?.hudView.alpha = 0.0
        }) { [weak self] isFinish in
            if let block = complete {
                block()
            }
            
            if isFinish {
                self?.hudView.removeFromSuperview()
            }
            
            if (self?.showCount ?? 0) < 0 {
                self?.showCount = 0
            }
        }
    }
    
    // MARK: - Private Methods
    /// 添加hudView
    private func qs_addHudView(toView: UIView? = nil,
                               img: String? = nil,
                               title: String? = nil,
                               isNeedMaskLayer: Bool,
                               isImgRotate: Bool,
                               maskLayerColor: UIColor? = nil,
                               toastViewColor: UIColor? = nil,
                               toastViewRadius: CGFloat? = nil,
                               titleColor: UIColor? = nil,
                               titleFont: UIFont? = nil) {
        hudView.backgroundColor = maskLayerColor
        hudView.isNeedMaskLayer = isNeedMaskLayer
        hudView.toastColor = toastViewColor ?? .white
        hudView.toastRadius = toastViewRadius ?? 10.0
        hudView.iconImg = img ?? ""
        hudView.title = title ?? ""
        hudView.titleFont = titleFont ?? UIFont.systemFont(ofSize: 17.0)
        hudView.titleColor = titleColor ?? .black
        hudView.isImgRotate = isImgRotate
        
        // 布局
        layoutHudView(hudView, toView: toView, isNeedMaskLayer: isNeedMaskLayer)
    }
    
    /// 布局HudView
    private func layoutHudView(_ view: QSHudView?, toView: UIView?, isNeedMaskLayer: Bool) {
        if let hudV = view {
            hudV.alpha = 0.0
            
            var theView = UIView.init()
            if toView == nil {
                theView = UIApplication.shared.keyWindow!
            } else {
                theView = toView!
            }
            
            theView.addSubview(hudView)
            hudV.snp.makeConstraints { (make) in
                if isNeedMaskLayer {
                    make.edges.equalTo(UIEdgeInsets.zero)
                } else {
                    make.center.equalTo(theView)
                    make.top.left.greaterThanOrEqualTo(50.0)
                    make.right.bottom.lessThanOrEqualTo(-50.0)
                }
            }
            // 动画显示
            qs_showHudView(hudV)
        }
    }
    
    /// 动画显示
    private func qs_showHudView(_ hudView: UIView) {
        hudView.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.35, animations: {
            hudView.alpha = 1.0
        })
    }
    
    // MARK: - Property
    /// 配置项
    // 加载中图片
    private var loadingImgName: String = "QSProgressHudBundle.bundle/icon_loading"
    // 成功图片
    private var successImgName: String = "QSProgressHudBundle.bundle/icon_success"
    // 失败图片
    private var errorImgName: String = "QSProgressHudBundle.bundle/icon_false"
    
    private var dismissTask: QSTask?
    
    // hudView
    private lazy var hudView: QSHudView = {
        let view = QSHudView.init(frame: .zero)
        return view
    }()
    
    // 引用计数
    private var showCount: Int = 0
}
