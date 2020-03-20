//
//  QSProgressHud.swift
//  QSProgressHud
//
//  Created by Song on 2019/7/29.
//  Copyright © 2019 Song. All rights reserved.
//

import UIKit

public class QSProgressHud {
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
    public class func qs_showProgress(toView: UIView? = nil,
                                      title: String? = nil,
                                      loadingImg: String? = nil,
                                      isNeedMaskLayer: Bool = true,
                                      isImgRotate: Bool = true,
                                      maskLayerColor: UIColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5),
                                      toastViewColor: UIColor = .white,
                                      toastViewRadius: CGFloat = 10.0,
                                      titleColor: UIColor = .black,
                                      titleFont: UIFont = UIFont.systemFont(ofSize: 17.0)) {
        QSHud.shared.qs_showProgress(toView: toView, title: title, loadingImg: loadingImg, isNeedMaskLayer: isNeedMaskLayer, isImgRotate: isImgRotate, maskLayerColor: maskLayerColor, toastViewColor: toastViewColor, toastViewRadius: toastViewRadius, titleColor: titleColor, titleFont: titleFont)
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
    public class func qs_showSuccess(toView: UIView? = nil,
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
        self.qs_dismiss()
        QSHud.shared.qs_showSuccess(toView: toView, title: title, successImg: successImg, isNeedMaskLayer: isNeedMaskLayer, maskLayerColor: maskLayerColor, toastViewColor: toastViewColor, toastViewRadius: toastViewRadius, titleColor: titleColor, titleFont: titleFont, dismissInterval: dismissInterval, dismissComplete: dismissComplete)
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
    public class func qs_showFailure(toView: UIView? = nil,
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
        self.qs_dismiss()
        QSHud.shared.qs_showError(toView: toView, title: title, errorImg: errorImg, isNeedMaskLayer: isNeedMaskLayer, maskLayerColor: maskLayerColor, toastViewColor: toastViewColor, toastViewRadius: toastViewRadius, titleColor: titleColor, titleFont: titleFont, dismissInterval: dismissInterval, dismissComplete: dismissComplete)
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
    public class func qs_showInfo(toView: UIView? = nil,
                                  title: String,
                                  isNeedMaskLayer: Bool = true,
                                  maskLayerColor: UIColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5),
                                  toastViewColor: UIColor = .white,
                                  toastViewRadius: CGFloat = 10.0,
                                  titleColor: UIColor = .black,
                                  titleFont: UIFont = UIFont.systemFont(ofSize: 17.0),
                                  dismissInterval: TimeInterval = 2.5,
                                  dismissComplete: (() -> ())? = nil) {
        self.qs_dismiss()
        QSHud.shared.qs_showText(toView: toView, title: title, isNeedMaskLayer: isNeedMaskLayer, maskLayerColor: maskLayerColor, toastViewColor: toastViewColor, toastViewRadius: toastViewRadius, titleColor: titleColor, titleFont: titleFont, dismissInterval: dismissInterval, dismissComplete: dismissComplete)
    }
    
    /// 消失
    public class func qs_dismiss() {
        QSHud.shared.qs_dismiss()
    }
}
