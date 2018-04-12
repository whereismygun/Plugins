#
#  Be sure to run `pod spec lint HPodSpecs.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  # 项目名称(.podspec一致)
  s.name         = "HPodSpecs"
  # 版本号
  s.version      = "0.0.1"
  # 简介
  s.summary      = "test HPodSpecs"

 # s.description  = <<-DESC
                 #  DESC
  # 项目主页
  s.homepage     = "http://EXAMPLE/HPodSpecs"

  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  
  # 许可证
  #s.license      = "MIT (example)"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
   s.license  = {:type => "MIT", :file => "LICENSE"}

  # 作者
  s.author             = { "13081397792" => "" }

   
  #项目地址 
 # s.source       = { :git => "http://EXAMPLE/HPodSpecs.git", :tag => "#{s.version}" }
  s.source       = { :git => "https://github.com/whereismygun/Plugins.git", :tag => "#{s.version}" }
 #s.source       = { :git => "https://github.com/whereismygun/Plugins.git", :tag => "#{s.version}" }
 # s.source       = { :git => "https://github.com/whereismygun/Plugins.git", :tag => "#{s.version}" }


  # 需要包含的源文件
  s.source_files  = "HPodSpecs", "HPodSpecs/*"
  #s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"



  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

  # 项目依赖
  # s.dependency "JSONKit", "~> 1.4"

end
