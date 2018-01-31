Pod::Spec.new do |s|
  s.name         = "AYNavigationBar"
  s.version      = "1.1.1"
  s.summary      = "A custom navigation bar for replace UINavigationBar."
  s.description  = "A custom navigation bar for replace UINavigationBar addtion with CocoaPods support."
  s.homepage     = "https://github.com/CodeABug/AYNavigationBar"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "gaoX" => "gao497868860@163.com" }
  s.platform = :ios, "8.0"
  s.source       = { :git => "https://github.com/CodeABug/AYNavigationBar.git", :tag => "1.1.1", :commit => "3a87a4e28fe146488902846aa200fd2793781019" }
  s.source_files  = "AYNavigationBar/*.{h,m}"
  s.requires_arc = true
  s.dependency "FDFullscreenPopGesture", "~> 1.1"

end