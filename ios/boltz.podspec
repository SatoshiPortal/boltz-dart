#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint hello_rust_ffi_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'boltz'
  s.version          = '0.1.6'
  s.summary          = 'A new Flutter FFI plugin project.'
  s.description      = <<-DESC
A new Flutter FFI plugin project.
                       DESC
  s.license          = { :file => '../LICENSE' }
  s.homepage         = 'https://github.com/SatoshiPortal'
  s.author           = { 'SatoshiPortal' => 'ishi@satoshiportal.com' }
  # s.platform = :ios, '13.0'


  # >>>>>> Everything after this line is new <<<<<<<

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'


  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    # Flutter.framework does not contain a i386 slice.
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
  }
end