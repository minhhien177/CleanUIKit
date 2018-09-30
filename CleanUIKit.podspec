Pod::Spec.new do |s|
  s.name             = 'CleanUIKit'
  s.version          = '1.0.0'
  s.summary          = 'UIKit helpers'

  s.description      = 'A collection of helpers to make it easier to work with UIKit'

  s.homepage         = 'https://github.com/minhhien177/CleanUIKit'
  s.license          = 'MIT'
  s.author           = { 'vomh' => 'minhhien177@gmail.com' }
  s.source           = { :git => 'https://github.com/minhhien177/CleanUIKit.git', :tag => '1.0.0' }

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'
  s.static_framework = true

  s.source_files = 'CleanUIKit/**/*'
end
