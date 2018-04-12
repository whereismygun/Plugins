Pod::Spec.new do |s|
    s.name         = "HPodSpecs"
    s.version      = "1.0.0"
    s.ios.deployment_target = '7.0'
    s.summary      = "A delightful setting interface framework."
    s.homepage     = "https://github.com/whereismygun/Plugins.git"
    s.license              = { :type => "MIT", :file => "LICENSE" }
    s.author             = { "13081397792" => "47079330@qq.com" }
    s.source       = { :git => "https://github.com/whereismygun/Plugins.git", :tag => s.version }
    s.source_files  = "HPodSpecs/*.{h,m}"
    s.requires_arc = true
end

