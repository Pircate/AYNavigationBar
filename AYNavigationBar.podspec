Pod::Spec.new do |s|
  s.name         = "AYNavigationBar"
  s.version      = "1.0.3"
  s.summary      = "A custom navigation bar replace UINavigationBar."
  s.description  = "A custom navigation bar replace UINavigationBar addtion with CocoaPods support."
  s.homepage     = "https://github.com/CodeABug/AYNavigationBar"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "gaoX" => "gao497868860@163.com" }
  s.platform = :ios, "8.0"
  s.source       = { :git => "https://github.com/CodeABug/AYNavigationBar.git", :tag => "1.0.3", :commit => "8d77691dbc2f524d79d9b6cc1150c1cf4ac691d4" }
  s.source_files  = "AYNavigationBar/*.{h,m}"
  s.frameworks   = 'UIKit'
  s.requires_arc = true
  s.dependency "FDFullscreenPopGesture", "~> 1.1"

end