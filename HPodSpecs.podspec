Pod::Spec.new do |s|
    s.name         = "HPodSpecs"
    s.version      = "1.0.0"
    s.ios.deployment_target = '7.0'
    s.summary      = "A delightful setting interface framework."
    s.homepage     = "https://github.com/whereismygun/Plugins.git"
    s.license              = { :type => "MIT", :file => "LICENSE" }
    s.author             = { "13081397792" => "47079330@qq.com" }
    s.source       = { :git => "https://github.com/whereismygun/Plugins.git", :tag => s.version }
 #  s.source_files  = "ZDLCProject/**/*.{h,m}"
    s.source_files  = "ZDLCProject/Expand/Tool/*"
    s.requires_arc = true

  #  s.dependency  'AFNetworking','~> 3.1.0'
  #  s.dependency  'CYLTabBarController','~>1.6.0'
  #  s.dependency  'IQKeyboardManager','~>3.2.4'
  #  s.dependency  'Masonry','~> 1.0.1'
  #  s.dependency  'MBProgressHUD','~>1.0.0'
  #  s.dependency  'MJExtension','~>3.0.13'
  #  s.dependency  'MJRefresh','~>3.1.12'
  #  s.dependency  'SDWebImage','~>3.8.1'
end

