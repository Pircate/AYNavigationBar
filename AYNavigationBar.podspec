Pod::Spec.new do |s|
  s.name         = "AYNavigationBar"
  s.version      = "1.1.9"
  s.summary      = "A custom navigation bar of UIViewController."
  s.description  = "A custom navigation bar of UIViewController addtion with CocoaPods support."
  s.homepage     = "https://github.com/Ginxx/AYNavigationBar"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "gaoX" => "gao497868860@163.com" }
  s.platform = :ios, "8.0"
  s.source       = { :git => "https://github.com/Ginxx/AYNavigationBar.git", :tag => "1.1.9", :commit => "2337ffb980648e9b1c97595f9bdb1e74ef623ce6" }
  s.source_files  = "AYNavigationBar/*.{h,m}"
  s.requires_arc = true

end