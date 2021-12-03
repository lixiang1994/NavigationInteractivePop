Pod::Spec.new do |s|

s.name         = "NavigationInteractivePop"
s.version      = "1.0.0"
s.summary      = "更好的控制导航控制器侧滑返回手势的状态"

s.homepage     = "https://github.com/lixiang1994/NavigationInteractivePop"

s.license      = { :type => "MIT", :file => "LICENSE" }

s.author       = { "LEE" => "18611401994@163.com" }

s.platform     = :ios, "9.0"

s.source       = { :git => "https://github.com/lixiang1994/NavigationInteractivePop.git", :tag => s.version }

s.source_files  = "Sources/**/*.swift"

s.requires_arc = true

s.frameworks = "UIKit", "Foundation"

s.swift_versions = ["5.0"]

end
