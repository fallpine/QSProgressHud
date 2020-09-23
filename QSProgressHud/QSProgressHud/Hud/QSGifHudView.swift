//
//  QSGifHudView.swift
//  QSProgressHud
//
//  Created by Song on 2020/9/22.
//  Copyright © 2020 Song. All rights reserved.
//

import UIKit

class QSGifHudView: QSHudContentView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        toastContentView.addSubview(gifView)
        gifView.snp.makeConstraints { (make) in
            make.top.equalTo(12.0)
            make.centerX.equalToSuperview()
            make.left.greaterThanOrEqualTo(12.0)
            make.right.lessThanOrEqualTo(-12.0)
            make.bottom.lessThanOrEqualTo(-12.0)
            make.size.equalTo(CGSize.init(width: 30.0, height: 30.0))
        }
        
        toastContentView.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.left.equalTo(12.0)
            make.right.bottom.equalTo(-12.0)
            make.top.equalTo(gifView.snp_bottom).offset(12.0)
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
                make.top.equalTo(gifView.snp_bottom).offset(0.0)
            } else {
                make.top.equalTo(gifView.snp_bottom).offset(12.0)
            }
        }
    }
    
    /// 设置gif
    /// - Parameters:
    ///   - url: gif的url
    ///   - isLocal: 是否是本地图片
    func setGif(url: URL, isLocal: Bool) {
        if isLocal {
            let maxSize = gifView.showLocalGif(with: url)
            if let size = maxSize {
                gifView.snp.updateConstraints { (make) in
                    make.size.equalTo(size)
                }
            }
        } else {
            gifView.shownNetGIF(with: url, sizeBlock: { [weak self] (maxSize) in
                if let size = maxSize {
                    self?.gifView.snp.updateConstraints { (make) in
                        make.size.equalTo(size)
                    }
                }
            })
        }
        
        
    }
    
    // MARK: - Widget
    private lazy var gifView: QSGifView = {
        let view = QSGifView.init(frame: .zero)
        return view
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
