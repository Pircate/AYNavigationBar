Pod::Spec.new do |s|
  s.name         = "AYNavigationBar"
  s.version      = "1.0.2"
  s.summary      = "A custom navigation bar replace UINavigationBar."
  s.description  = "A custom navigation bar replace UINavigationBar addtion with CocoaPods support."
  s.homepage     = "https://github.com/CodeABug/AYNavigationBar"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "gaoX" => "gao497868860@163.com" }
  s.platform = :ios, "8.0"
  s.source       = { :git => "https://github.com/CodeABug/AYNavigationBar.git", :tag => "1.0.2", :commit => "cca19df87675e27defd40ed62cd2389fe336120b" }
  s.source_files  = "AYNavigationBar/*.{h,m}"
  s.frameworks   = 'UIKit'
  s.requires_arc = true
  s.dependency "FDFullscreenPopGesture", "~> 1.1"

end