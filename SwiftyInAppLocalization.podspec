Pod::Spec.new do |s|
  s.name             = 'SwiftyInAppLocalization'
  s.version          = '1.1.0'
  s.summary          = 'Support for switching the language at run time. Compatible with both Swift and Objective-C.'

  s.homepage         = 'https://github.com/janlionly/SwiftyInAppLocalization'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'janlionly' => 'janlionly@gmail.com' }
  s.source           = { :git => 'https://github.com/janlionly/SwiftyInAppLocalization.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/janlionly'
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.source_files = 'Sources/SwiftyInAppLocalization/*.{h,m}'
  s.frameworks = 'UIKit'
  s.swift_versions = ['4.2', '5.0', '5.1', '5.2']
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
end
