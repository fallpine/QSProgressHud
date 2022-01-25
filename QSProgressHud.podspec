Pod::Spec.new do |spec|
  spec.name         = "QSProgressHud"
  spec.version      = "2.0.0"
  spec.summary      = "提示框。"
  spec.description  = "加载、成功、失败、文字提示框！"

  spec.homepage     = "https://www.jianshu.com/u/7be4a0163a7f"
    
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = "Song"
  spec.platform     = :ios, "11.0"

  spec.source       = { :git => "https://github.com/fallpine/QSProgressHud.git", :tag => "2.0.0" }

  spec.source_files  = "QSProgressHud", "QSProgressHud/QSProgressHud/Hud/**/*.{swift}"

  spec.resource  = "QSProgressHud/QSProgressHud/Hud/QSProgressHudBundle.bundle"
    
  spec.dependency "SnapKit"
  spec.dependency "Kingfisher"
  spec.swift_version = '5'
end
