# QSProgressHud
这是一个，加载、成功、失败、文字的提示框工具

使用方法：直接用Pod导入，pod 'QSProgressHud'

先看下效果：

<img src="https://github.com/fallpine/QSProgressHud/blob/master/Screenshots/loading.png" width="200"/>  <img src="https://github.com/fallpine/QSProgressHud/blob/master/Screenshots/loading1.png" width="200"/>  <img src="https://github.com/fallpine/QSProgressHud/blob/master/Screenshots/success.png" width="200"/>  
<img src="https://github.com/fallpine/QSProgressHud/blob/master/Screenshots/failure.png" width="200"/>  <img src="https://github.com/fallpine/QSProgressHud/blob/master/Screenshots/infoText.png" width="200"/>

QSProgressHud是单例，使用时创建单例，再调用单例中的对应方法即可
```
QSProgressHud.shared
```

相关方法：
```
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
                         titleFont: UIFont = UIFont.systemFont(ofSize: 14.0))
                         
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
                        dismiss: (() -> ())? = nil)

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
                      dismiss: (() -> ())? = nil)

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
                     dismiss: (() -> ())? = nil)

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
                        dismiss: (() -> ())? = nil)
                               
/// 消失
public func qs_dismiss(animated: Bool = true)
```

#### 版本更新
2.0.0版本之后需要使用iOS11才能使用，如果需要支持iOS11之前版本，可使用2.0.0之前版本
