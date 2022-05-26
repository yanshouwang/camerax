#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint camerax.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'camerax'
  s.version          = '0.0.1'
  s.summary          = 'A camera plugin for flutter.'
  s.description      = 'A camera plugin for flutter, which use CameraX on Android, native API on iOS, supports preview and image analysis.'
  s.homepage         = 'https://github.com/yanshouwang/camerax'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'yanshouwang' => 'yanshouwang@outlook.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.static_framework = true
  s.platform = :ios, '10.0'
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
