Pod::Spec.new do |s|
  s.name         = "AYNavigationBar"
  s.version      = "1.1.5"
  s.summary      = "A custom navigation bar for UIViewController."
  s.description  = "A custom navigation bar for UIViewController addtion with CocoaPods support."
  s.homepage     = "https://github.com/CodeABug/AYNavigationBar"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "gaoX" => "gao497868860@163.com" }
  s.platform = :ios, "8.0"
  s.source       = { :git => "https://github.com/CodeABug/AYNavigationBar.git", :tag => "1.1.5", :commit => "fd80ad7f95d4fffd18c52aaf3f0b0041e54d0e66" }
  s.source_files  = "AYNavigationBar/*.{h,m}"
  s.requires_arc = true

end