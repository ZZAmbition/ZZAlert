#
#  Be sure to run `pod spec lint ZZAlert.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  These will help people to find your library, and whilst it
#  can feel like a chore to fill in it's definitely to your advantage. The
#  summary should be tweet-length, and the description more in depth.
#

spec.name         = "ZZAlert"
spec.version      = "0.0.1"
spec.summary      = "通用弹出视图协议"
spec.homepage     = "https://github.com/ZZAmbition/ZZAlert"
spec.license      = { :type => "MIT", :file => "LICENSE" }
spec.author             = { "ZZAmbition" => "853489221@qq.com" }
spec.source       = { :git => "https://github.com/ZZAmbition/ZZAlert.git", :tag => "#{spec.version}" }
spec.source_files  = "ZZAlert/**/*.{swift,h,m}"
spec.ios.deployment_target = '10.0'
spec.swift_version = '5.0'

end
