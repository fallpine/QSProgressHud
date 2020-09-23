//
//  QSProgressHud.swift
//  QSProgressHud
//
//  Created by Song on 2019/7/29.
//  Copyright © 2019 Song. All rights reserved.
//

import UIKit

public class QSProgressHud {
    // 单例
    public static var shared: QSProgressHud {
        struct Static {
            static let instance : QSProgressHud = QSProgressHud()
        }
        return Static.instance
    }
    
    // MARK: - Func
    /// 加载中
    ///
    /// - Parameters:
    ///   - view: 吐司加到哪个view上，nil加到window
    ///   - loadingImg: 加载中图片
    ///   - isMask: 是否需要遮罩
    ///   - maskColor: 遮罩层颜色
    ///   - toastColor: 吐司颜色
    ///   - toastRadius: 吐司圆角
    ///   - title: 标题
    ///   - titleColor: 标题颜色
    ///   - titleFont: 标题字体
    public func qs_showProgress(to view: UIView? = nil,
                         loadingImg: String? = nil,
                         isMask: Bool = true,
                         maskColor: UIColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5),
                         toastColor: UIColor = .white,
                         toastRadius: CGFloat = 10.0,
                         title: String? = nil,
                         titleColor: UIColor = .black,
                         titleFont: UIFont = UIFont.systemFont(ofSize: 14.0)) {
        // 把之前显示的hud隐藏掉
        qs_dismiss()
        
        let img = loadingImg == nil ? loadingImgName : loadingImg
        
        let hudView = QSLoadingHudView.init(frame: .zero)
        self.hudView = hudView
        hudView.setToast(isMask: isMask, maskColor: maskColor, toastColor: toastColor, toastRadius: toastRadius)
        hudView.setTitle(text: title ?? "", font: titleFont, color: titleColor)
        hudView.iconImg = img ?? ""
        hudView.isImgRotate = true
        
        hudView.showHudView(to: view, interval: nil, dismiss: nil)
    }
    
    /// 成功
    ///
    /// - Parameters:
    ///   - view: 吐司加到哪个view上，nil加到window
    ///   - successImg: 成功图片
    ///   - isMask: 是否需要遮罩
    ///   - maskColor: 遮罩颜色
    ///   - toastColor: 吐司颜色
    ///   - toastRadius: 吐司圆角
    ///   - title: 标题
    ///   - titleColor: 标题颜色
    ///   - titleFont: 标题字体
    ///   - interval: 显示时长
    ///   - dismiss: 消失回调
    public func qs_showSuccess(to view: UIView? = nil,
                        successImg: String? = nil,
                        isMask: Bool = true,
                        maskColor: UIColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5),
                        toastColor: UIColor = .white,
                        toastRadius: CGFloat = 10.0,
                        title: String? = nil,
                        titleColor: UIColor = .black,
                        titleFont: UIFont = UIFont.systemFont(ofSize: 14.0),
                        interval: TimeInterval = 2.0,
                        dismiss: (() -> ())? = nil) {
        // 把之前显示的hud隐藏掉
        qs_dismiss()
        
        let img = successImg == nil ? successImgName : successImg
        
        let hudView = QSImageAndTitleHudView.init(frame: .zero)
        self.hudView = hudView
        hudView.setToast(isMask: isMask, maskColor: maskColor, toastColor: toastColor, toastRadius: toastRadius)
        hudView.setTitle(text: title ?? "", font: titleFont, color: titleColor)
        hudView.iconImg = img ?? ""
        
        hudView.showHudView(to: view, interval: interval, dismiss: dismiss)
    }
    
    /// 失败
    ///
    /// - Parameters:
    ///   - view: 吐司加到哪个view上，nil加到window
    ///   - errorImg: 错误图片
    ///   - isMask: 是否需要遮罩
    ///   - maskColor: 遮罩颜色
    ///   - toastColor: 吐司颜色
    ///   - toastRadius: 吐司圆角
    ///   - title: 标题
    ///   - titleColor: 标题颜色
    ///   - titleFont: 标题字体
    ///   - interval: 显示时长
    ///   - dismiss: 消失回调
    public func qs_showError(to view: UIView? = nil,
                      errorImg: String? = nil,
                      isMask: Bool = true,
                      maskColor: UIColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5),
                      toastColor: UIColor = .white,
                      toastRadius: CGFloat = 10.0,
                      title: String? = nil,
                      titleColor: UIColor = .black,
                      titleFont: UIFont = UIFont.systemFont(ofSize: 14.0),
                      interval: TimeInterval = 2.0,
                      dismiss: (() -> ())? = nil) {
        // 把之前显示的hud隐藏掉
        qs_dismiss()
        
        let img = errorImg == nil ? errorImgName : errorImg
        
        let hudView = QSImageAndTitleHudView.init(frame: .zero)
        self.hudView = hudView
        hudView.setToast(isMask: isMask, maskColor: maskColor, toastColor: toastColor, toastRadius: toastRadius)
        hudView.setTitle(text: title ?? "", font: titleFont, color: titleColor)
        hudView.iconImg = img ?? ""
        
        hudView.showHudView(to: view, interval: interval, dismiss: dismiss)
    }
    
    /// 文字
    ///
    /// - Parameters:
    ///   - view: 吐司加到哪个view上，nil加到window
    ///   - isMask: 是否需要遮罩
    ///   - maskColor: 遮罩颜色
    ///   - toastColor: 吐司颜色
    ///   - toastRadius: 吐司圆角
    ///   - title: 标题
    ///   - titleColor: 标题颜色
    ///   - titleFont: 标题字体
    ///   - interval: 显示时长
    ///   - dismiss: 消失后回调
    public func qs_showText(to view: UIView? = nil,
                     isMask: Bool = true,
                     maskColor: UIColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5),
                     toastColor: UIColor = .white,
                     toastRadius: CGFloat = 10.0,
                     title: String,
                     titleColor: UIColor = .black,
                     titleFont: UIFont = UIFont.systemFont(ofSize: 14.0),
                     interval: TimeInterval = 2.0,
                     dismiss: (() -> ())? = nil) {
        // 把之前显示的hud隐藏掉
        qs_dismiss()
        
        let hudView = QSImageAndTitleHudView.init(frame: .zero)
        self.hudView = hudView
        hudView.setToast(isMask: isMask, maskColor: maskColor, toastColor: toastColor, toastRadius: toastRadius)
        hudView.setTitle(text: title, font: titleFont, color: titleColor)
        hudView.iconImg = ""
        
        hudView.showHudView(to: view, interval: interval, dismiss: dismiss)
    }
    
    /// gif
    ///
    /// - Parameters:
    ///   - view: 吐司加到哪个view上，nil加到window
    ///   - gifUrl: 成功图片
    ///   - isLocalGif: 是否是本地的gif图片
    ///   - isMask: 是否需要遮罩
    ///   - maskColor: 遮罩颜色
    ///   - toastColor: 吐司颜色
    ///   - toastRadius: 吐司圆角
    ///   - title: 标题
    ///   - titleColor: 标题颜色
    ///   - titleFont: 标题字体
    ///   - interval: 显示时长
    ///   - dismiss: 消失回调
    public func qs_showGif(to view: UIView? = nil,
                        gifUrl: URL,
                        isLocalGif: Bool,
                        isMask: Bool = true,
                        maskColor: UIColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5),
                        toastColor: UIColor = .white,
                        toastRadius: CGFloat = 10.0,
                        title: String? = nil,
                        titleColor: UIColor = .black,
                        titleFont: UIFont = UIFont.systemFont(ofSize: 14.0),
                        interval: TimeInterval = 2.0,
                        dismiss: (() -> ())? = nil) {
        // 把之前显示的hud隐藏掉
        qs_dismiss()
        
        let hudView = QSGifHudView.init(frame: .zero)
        self.hudView = hudView
        hudView.setToast(isMask: isMask, maskColor: maskColor, toastColor: toastColor, toastRadius: toastRadius)
        hudView.setTitle(text: title ?? "", font: titleFont, color: titleColor)
        hudView.setGif(url: gifUrl, isLocal: isLocalGif)
        
        hudView.showHudView(to: view, interval: interval, dismiss: dismiss)
    }
    
    /// 消失
    public func qs_dismiss() {
        hudView?.dismiss()
        hudView = nil
    }
    
    // MARK: - Property
    /// 配置项
    // 加载中图片
    private var loadingImgName: String = "QSProgressHudBundle.bundle/icon_loading"
    // 成功图片
    private var successImgName: String = "QSProgressHudBundle.bundle/icon_success"
    // 失败图片
    private var errorImgName: String = "QSProgressHudBundle.bundle/icon_false"
    
    // hudView
    private var hudView: QSHudContentView?
}
