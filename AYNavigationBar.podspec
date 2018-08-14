Pod::Spec.new do |s|
  s.name         = "AYNavigationBar"
  s.version      = "1.3.1"
  s.summary      = "A custom navigation bar of UIViewController."
  s.description  = "A custom navigation bar of UIViewController addtion with CocoaPods support."
  s.homepage     = "https://github.com/Pircate/AYNavigationBar"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Pircate" => "gao497868860@163.com" }
  s.platform = :ios, "8.0"
  s.source       = { :git => "https://github.com/Pircate/AYNavigationBar.git", :tag => "1.3.1" }
  s.source_files  = "AYNavigationBar/*.{h,m}"
  s.requires_arc = true

end