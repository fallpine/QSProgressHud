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
    /// 设置配置项
    ///
    /// - Parameters:
    ///   - maskLayerColor: 遮罩层颜色
    ///   - toastViewColor: 吐司颜色
    ///   - toastViewRadius: 吐司圆角
    ///   - titleColor: title颜色
    ///   - titleFont: title字体
    ///   - loadingImg: 加载中图片
    ///   - successImg: 成功图片
    ///   - errorImg: 失败图片
    ///   - dismissInterval: 多久消失
    func qs_setConfigurationItems(maskLayerColor: UIColor? = nil, toastViewColor: UIColor? = nil, toastViewRadius: CGFloat? = nil, titleColor: UIColor? = nil, titleFont: UIFont? = nil, loadingImg: String? = nil, successImg: String? = nil, errorImg: String? = nil, dismissInterval: TimeInterval? = nil) {
        if maskLayerColor != nil {
            self.maskLayerColor = maskLayerColor!
        }
        
        if toastViewColor != nil {
            self.toastViewColor = toastViewColor!
        }
        
        if toastViewRadius != nil {
            self.toastViewRadius = toastViewRadius!
        }
        
        if titleColor != nil {
            self.titleColor = titleColor!
        }
        
        if titleFont != nil {
            self.titleFont = titleFont!
        }
        
        if loadingImg != nil {
            self.loadingImgName = loadingImg!
        }
        
        if successImg != nil {
            self.successImgName = successImg!
        }
        
        if errorImg != nil {
            self.errorImgName = errorImg!
        }
        
        if dismissInterval != nil {
            self.dismissInterval = dismissInterval!
        }
    }
    
    /// 加载中
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - toView: 吐司加到哪个view上，nil加到window
    ///   - isNeedMaskLayer: 是否需要遮罩
    func qs_showProgress(title: String? = nil, toView: UIView? = nil, isNeedMaskLayer: Bool = true) {
        // 引用计数加一
        showCount += 1
        qs_addHudView(toView: toView, img: QSHud.shared.loadingImgName, title: title, isNeedMaskLayer: isNeedMaskLayer, isImgRotate: true, dismissComplete: nil)
    }
    
    /// 成功
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - toView: 吐司加到哪个view上，nil加到window
    ///   - isNeedMaskLayer: 是否需要遮罩
    ///   - dismissInterval: 消失时间，默认2.5秒
    ///   - dismissComplete: 消失后回调
    func qs_showSuccess(title: String? = nil, toView: UIView? = nil, isNeedMaskLayer: Bool = true, dismissInterval: TimeInterval = 2.5, dismissComplete: (() -> ())? = nil) {
        // 引用计数加一
        showCount += 1
        qs_addHudView(toView: toView, img: QSHud.shared.successImgName, title: title, isNeedMaskLayer: isNeedMaskLayer, isImgRotate: false, dismissComplete: dismissComplete)
        
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
    ///   - title: 标题
    ///   - toView: 吐司加到哪个view上，nil加到window
    ///   - isNeedMaskLayer: 是否需要遮罩
    ///   - dismissInterval: 消失时间，默认2.5秒
    ///   - dismissComplete: 消失后回调
    func qs_showError(title: String? = nil, toView: UIView? = nil, isNeedMaskLayer: Bool = true, dismissInterval: TimeInterval = 2.5, dismissComplete: (() -> ())? = nil) {
        // 引用计数加一
        showCount += 1
        qs_addHudView(toView: toView, img: errorImgName, title: title, isNeedMaskLayer: isNeedMaskLayer, isImgRotate: false, dismissComplete: dismissComplete)
        
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
    ///   - title: 标题
    ///   - toView: 吐司加到哪个view上，nil加到window
    ///   - isNeedMaskLayer: 是否需要遮罩
    ///   - dismissInterval: 消失时间，默认2.5秒
    ///   - dismissComplete: 消失后回调
    func qs_showText(title: String, toView: UIView? = nil, isNeedMaskLayer: Bool = true, dismissInterval: TimeInterval = 2.5, dismissComplete: (() -> ())? = nil) {
        // 引用计数加一
        showCount += 1
        qs_addHudView(toView: toView, img: nil, title: title, isNeedMaskLayer: isNeedMaskLayer, isImgRotate: false, dismissComplete: dismissComplete)
        
        // 自动消失
        if dismissInterval > 0.0 {
            dismissTask = QSDispatch.qs_delay(dismissInterval) { [weak self] in
                self?.qs_dismiss(complete: dismissComplete)
            }
        }
    }
    
    /// 消失
    func qs_dismiss(complete: (() -> ())? = nil) {
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
        }) { [weak self] _ in
            if let block = complete {
                block()
            }
            self?.hudView.removeFromSuperview()
            self?.showCount = 0
        }
    }
    
    // MARK: - Private Methods
    private func qs_addHudView(toView: UIView? = nil, img: String? = nil, title: String? = nil, isNeedMaskLayer: Bool, isImgRotate: Bool, dismissComplete: (() -> ())? = nil) {
        hudView.isNeedMaskLayer = isNeedMaskLayer
        hudView.toastColor = toastViewColor
        hudView.toastRadius = toastViewRadius
        hudView.iconImg = img ?? ""
        hudView.title = title ?? ""
        hudView.titleFont = titleFont
        hudView.titleColor = titleColor
        hudView.isImgRotate = isImgRotate
        
        // 消失回调
        hudDismissComplete = dismissComplete
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
            
            if isNeedMaskLayer {
                hudV.backgroundColor = maskLayerColor
            }
            // 显示动画
            qs_showHudView(hudV)
        }
    }
    
    /// 显示
    private func qs_showHudView(_ hudView: UIView) {
        UIView.animate(withDuration: 0.35, animations: {
            hudView.alpha = 1.0
        })
    }
    
    // MARK: - Property
    /// 配置项
    // 遮罩颜色
    private var maskLayerColor: UIColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
    // 吐司背景颜色
    private var toastViewColor: UIColor = UIColor.white
    // 吐司的圆角
    private var toastViewRadius: CGFloat = 10.0
    // title字体颜色
    private var titleColor: UIColor = UIColor.black
    // title字体大小
    private var titleFont: UIFont = UIFont.systemFont(ofSize: 17.0)
    // 吐司消失时间
    private var dismissInterval: TimeInterval = 2.5
    // 加载中图片
    private var loadingImgName: String = "QSProgressHudBundle.bundle/icon_loading"
    // 成功图片
    private var successImgName: String = "QSProgressHudBundle.bundle/icon_success"
    // 失败图片
    private var errorImgName: String = "QSProgressHudBundle.bundle/icon_false"
    
    // 消失完成时的回调
    private var hudDismissComplete: (() -> ())?
    private var dismissTask: QSTask?
    
    // hudView
    private lazy var hudView: QSHudView = {
        let view = QSHudView.init(frame: .zero)
        view.toastColor = toastViewColor
        view.toastRadius = toastViewRadius
        view.titleColor = titleColor
        view.titleFont = titleFont
        return view
    }()
    
    // 引用计数
    private var showCount: Int = 0
}
