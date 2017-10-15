#
#  Be sure to run `pod spec lint HePaiPay.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "LL2048"
  s.version      = "1.0.0"
  s.summary      = "use for Lilong LL2048 module."
  s.description  = <<-DESC
		   use for LL2048 module.
		   It’s awesome!!
                   DESC

  s.homepage     = "https://github.com/LiGuanWen/LL2048"
  s.license      = "MIT"
  s.author       = { "Lilong" => "diqidaimu@qq.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/LiGuanWen/LL2048.git", :branch => "#{s.version}" }
  s.source_files  = "LL2048Class/**/*.{h,m}"

end
