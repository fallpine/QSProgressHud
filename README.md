# QSProgressHud
这是一个，加载、成功、失败、文字的提示框工具
使用方法：直接用Pod导入，pod 'QSExtensions'

```
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
///   - dismissInterval: 消失时间
public class func qs_setConfiguration(maskLayerColor: UIColor? = nil,
                                   toastViewColor: UIColor? = nil,
                                   toastViewRadius:  CGFloat? = nil,
                                   titleColor: UIColor? = nil,
                                   titleFont: UIFont? = nil,
                                   loadingImg: String? = nil,
                                   successImg: String? = nil,
                                   errorImg: String? = nil,
                                   dismissInterval: TimeInterval? = nil)
通过调用这个方法，可以自定义 遮罩层颜色、吐司颜色、title颜色、title字体、加载中图片、成功图片、失败图片、消失时间，其中 消失时间 对loading状态无效，加载中的状态只能通过手动调用dismiss方法才能关闭

/// 加载中
///
/// - Parameters:
///   - toView: 吐司加到哪个view上，nil加到window
///   - title: 标题
///   - isNeedMaskLayer: 是否需要遮罩
public class func qs_showProgress(toView: UIView? = nil,
                               title: String? = nil,
                               isNeedMaskLayer: Bool = true)
                               
/// 成功
///
/// - Parameters:
///   - toView: 吐司加到哪个view上，nil加到window
///   - title: 标题
///   - isNeedMaskLayer: 是否需要遮罩
///   - dismissInterval: 消失时间，默认2.5秒
///   - dismissComplete: 消失后回调
public class func qs_showSuccess(toView: UIView? = nil,
                        title: String? = nil,
                        isNeedMaskLayer: Bool = true,
                        dismissInterval: TimeInterval = 2.5,
                        dismissComplete: (() -> ())? = nil)
                        
/// 失败
///
/// - Parameters:
///   - toView: 吐司加到哪个view上，nil加到window
///   - title: 标题
///   - isNeedMaskLayer: 是否需要遮罩
///   - dismissInterval: 消失时间，默认2.5秒
///   - dismissComplete: 消失后回调
public class func qs_showFailure(toView: UIView? = nil,
                      title: String? = nil,
                      isNeedMaskLayer: Bool = true,
                      dismissInterval: TimeInterval = 2.5,
                      dismissComplete: (() -> ())? = nil)
                      
/// 文字
///
/// - Parameters:
///   - toView: 吐司加到哪个view上，nil加到window
///   - title: 标题
///   - isNeedMaskLayer: 是否需要遮罩
///   - dismissInterval: 消失时间，默认2.5秒
///   - dismissComplete: 消失后回调
public class func qs_showInfo(toView: UIView? = nil,
                     title: String,
                     isNeedMaskLayer: Bool = true,
                     dismissInterval: TimeInterval = 2.5,
                     dismissComplete: (() -> ())? = nil)
                     
/// 消失
public class func qs_dismiss()
```

![image](https://github.com/fallpine/QSProgressHud/Screenshots/failure.png)
