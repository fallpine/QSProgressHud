//
//  QSDispatch.swift
//  TestSwift
//
//  Created by Song on 2018/5/10.
//  Copyright © 2018年 Song. All rights reserved.
//

import UIKit

typealias QSTask = (_ cancle : Bool) -> Void

class QSDispatch: NSObject {
    /// 延迟
    ///
    /// - Parameters:
    ///   - time: 延迟时间
    ///   - task: 任务
    class func qs_delay(_ time: TimeInterval, task: @escaping() -> ()) -> QSTask? {
        
        func dispatch_later(block: @escaping()->()) {
            let t = DispatchTime.now() + time
            DispatchQueue.main.asyncAfter(deadline: t, execute: block)
        }
        
        var closure : (() -> Void)? = task
        var result : QSTask?
        
        let delayedClosure : QSTask = { cancle in
            if let internalClosure = closure {
                if cancle == false {
                    DispatchQueue.main.async(execute: internalClosure)
                }
            }
            closure = nil
            result = nil
        }
        
        result = delayedClosure
        
        dispatch_later {
            if let delayedClosure = result {
                delayedClosure(false)
            }
        }
        
        return result
    }
    
    class func qs_cancle(_ task: QSTask?) {
        task?(true)
    }
}
