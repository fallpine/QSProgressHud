//
//  QSHudContentView.swift
//  QSProgressHud
//
//  Created by Song on 2020/9/22.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit
import SnapKit

class QSHudContentView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.addSubview(toastContentView)
        toastContentView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.top.left.greaterThanOrEqualTo(80.0)
            make.right.bottom.lessThanOrEqualTo(-80.0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Func
    /// 设置吐司样式
    /// - Parameters:
    ///   - isMask: 是否需要遮罩
    ///   - maskColor: 遮罩颜色
    ///   - color: 吐司颜色
    ///   - radius: 吐司圆角
    func setToast(isMask: Bool, maskColor: UIColor, toastColor: UIColor, toastRadius: CGFloat) {
        self.isMask = isMask
        
        toastContentView.snp.remakeConstraints { (make) in
            if isMask {
                make.center.equalTo(self)
                make.top.left.greaterThanOrEqualTo(80.0)
                make.right.bottom.lessThanOrEqualTo(-80.0)
            } else {
                make.edges.equalToSuperview()
            }
        }
        
        toastContentView.backgroundColor = toastColor
        toastContentView.layer.cornerRadius = toastRadius
        toastContentView.layer.masksToBounds = true
        
        if !isMask {
            self.backgroundColor = .clear
            self.layer.cornerRadius = toastRadius
            self.layer.masksToBounds = true
        } else {
            self.backgroundColor = maskColor
            self.layer.cornerRadius = 0.0
            self.layer.masksToBounds = true
        }
    }
    
    /// 显示
    /// - Parameters:
    ///   - view: 父视图
    ///   - interval: 显示时间，nil标识一直显示
    ///   - dismiss: 消失时回调
    func showHudView(to view: UIView?, interval: TimeInterval?, dismiss: (() -> ())?) {
        self.alpha = 0.0
        dismissBlock = dismiss
        
        // 显示时间
        if let showTime = interval {
            dismissTask = QSDispatch.qs_delay(showTime) { [weak self] in
                self?.dismiss(animated: true)
            }
        }
        
        var parentView: UIView?
        if view == nil {
            if let keyWindow = UIApplication.shared.keyWindow {
                parentView = keyWindow
            }
        } else {
            parentView = view!
        }
        
        guard let contentView = parentView else {
            debugPrint("父视图不能为空")
            return
        }
        
        contentView.addSubview(self)
        self.snp.makeConstraints { [unowned self] (make) in
            if self.isMask {
                make.edges.equalTo(UIEdgeInsets.zero)
            } else {
                make.center.equalTo(contentView)
                make.top.left.greaterThanOrEqualTo(80.0)
                make.right.bottom.lessThanOrEqualTo(-80.0)
            }
        }
        
        layer.removeAllAnimations()
        UIView.animate(withDuration: 0.35, animations: { [weak self] in
            self?.alpha = 1.0
        })
    }
    
    /// 消失
    func dismiss(animated: Bool) {
        if !animated {
            backgroundColor = .clear
        }
        
        UIView.animate(withDuration: 0.35, animations: { [weak self] in
            self?.alpha = 0.0
        }) { [weak self] _ in
            if let block = self?.dismissBlock {
                // 取消定时
                QSDispatch.qs_cancle(self?.dismissTask)
                block()
            }
            self?.dismissBlock = nil
            self?.removeFromSuperview()
        }
    }
    
    // MARK: - Property
    private var isMask: Bool = true
    private var dismissTask: QSTask?
    private var dismissBlock: (() -> ())?
    
    // MARK: - Widget
    lazy var toastContentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = .white
        return view
    }()
}
