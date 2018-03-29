Pod::Spec.new do |s|
  s.name         = "AYNavigationBar"
  s.version      = "1.1.7"
  s.summary      = "A custom navigation bar of UIViewController."
  s.description  = "A custom navigation bar of UIViewController addtion with CocoaPods support."
  s.homepage     = "https://github.com/GorXion/AYNavigationBar"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "gaoX" => "gao497868860@163.com" }
  s.platform = :ios, "8.0"
  s.source       = { :git => "https://github.com/GorXion/AYNavigationBar.git", :tag => "1.1.7", :commit => "15e1711549b3ad0a1d48c0ba20f0692470416a08" }
  s.source_files  = "AYNavigationBar/*.{h,m}"
  s.requires_arc = true

end