//
//  QSProgressHud.swift
//  QSProgressHud
//
//  Created by Song on 2019/7/29.
//  Copyright © 2019 Song. All rights reserved.
//

import UIKit

public class QSProgressHud {
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
    class func qs_setConfiguration(maskLayerColor: UIColor? = nil,
                                   toastViewColor: UIColor? = nil,
                                   toastViewRadius:  CGFloat? = nil,
                                   titleColor: UIColor? = nil,
                                   titleFont: UIFont? = nil,
                                   loadingImg: String? = nil,
                                   successImg: String? = nil,
                                   errorImg: String? = nil,
                                   dismissInterval: TimeInterval? = nil) {
        QSHud.shared.qs_setConfigurationItems(maskLayerColor: maskLayerColor,
                                              toastViewColor: toastViewColor,
                                              toastViewRadius: toastViewRadius,
                                              titleColor: titleColor,
                                              titleFont: titleFont,
                                              loadingImg: loadingImg,
                                              successImg: successImg,
                                              errorImg: errorImg,
                                              dismissInterval: dismissInterval)
    }
    
    /// 加载中
    ///
    /// - Parameters:
    ///   - toView: 吐司加到哪个view上，nil加到window
    ///   - title: 标题
    ///   - isNeedMaskLayer: 是否需要遮罩
    class func qs_showProgress(toView: UIView? = nil,
                               title: String? = nil,
                               isNeedMaskLayer: Bool = true) {
        QSHud.shared.qs_showProgress(title: title, toView: toView, isNeedMaskLayer: isNeedMaskLayer)
    }
    
    /// 成功
    ///
    /// - Parameters:
    ///   - toView: 吐司加到哪个view上，nil加到window
    ///   - title: 标题
    ///   - isNeedMaskLayer: 是否需要遮罩
    ///   - dismissInterval: 消失时间，默认2.5秒
    ///   - dismissComplete: 消失后回调
    class func qs_showSuccess(toView: UIView? = nil,
                        title: String? = nil,
                        isNeedMaskLayer: Bool = true,
                        dismissInterval: TimeInterval = 2.5,
                        dismissComplete: (() -> ())? = nil) {
        QSHud.shared.qs_showSuccess(title: title, toView: toView, isNeedMaskLayer: isNeedMaskLayer, dismissInterval: dismissInterval, dismissComplete: dismissComplete)
    }
    
    /// 失败
    ///
    /// - Parameters:
    ///   - toView: 吐司加到哪个view上，nil加到window
    ///   - title: 标题
    ///   - isNeedMaskLayer: 是否需要遮罩
    ///   - dismissInterval: 消失时间，默认2.5秒
    ///   - dismissComplete: 消失后回调
    class func qs_showFailure(toView: UIView? = nil,
                      title: String? = nil,
                      isNeedMaskLayer: Bool = true,
                      dismissInterval: TimeInterval = 2.5,
                      dismissComplete: (() -> ())? = nil) {
        QSHud.shared.qs_showError(title: title, toView: toView, isNeedMaskLayer: isNeedMaskLayer, dismissInterval: dismissInterval, dismissComplete: dismissComplete)
    }
    
    /// 文字
    ///
    /// - Parameters:
    ///   - toView: 吐司加到哪个view上，nil加到window
    ///   - title: 标题
    ///   - isNeedMaskLayer: 是否需要遮罩
    ///   - dismissInterval: 消失时间，默认2.5秒
    ///   - dismissComplete: 消失后回调
    class func qs_showInfo(toView: UIView? = nil,
                     title: String,
                     isNeedMaskLayer: Bool = true,
                     dismissInterval: TimeInterval = 2.5,
                     dismissComplete: (() -> ())? = nil) {
        QSHud.shared.qs_showText(title: title, toView: toView, isNeedMaskLayer: isNeedMaskLayer, dismissInterval: dismissInterval, dismissComplete: dismissComplete)
    }
    
    /// 消失
    class func qs_dismiss() {
        QSHud.shared.qs_dismiss()
    }
}
