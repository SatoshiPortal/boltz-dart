#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint hello_rust_ffi_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'boltzt'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter FFI plugin project.'
  s.description      = <<-DESC
A new Flutter FFI plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  # s.platform = :ios, '13.0'


  # >>>>>> Everything after this line is new <<<<<<<

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'

  s.script_phase = {
    :name => 'Build Rust library',
    # First argument is relative path to the `rust` folder, second is name of rust library
    :script => 'sh "$PODS_TARGET_SRCROOT/../cargokit/build_pod.sh" ../rust boltzt',
    :execution_position => :before_compile,
    :input_files => ['${BUILT_PRODUCTS_DIR}/cargokit_phony'],
    # Let XCode know that the static library referenced in -force_load below is
    # created by this build step.
    :output_files => ["${BUILT_PRODUCTS_DIR}/libboltzt.a"],
  }
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    # Flutter.framework does not contain a i386 slice.
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
    'OTHER_LDFLAGS' => '-force_load ${BUILT_PRODUCTS_DIR}/libboltzt.a',
  }
end

# read_key_value_pairs = lambda do |file_path|
#   pairs = {}
#   File.foreach(file_path) do |line|
#     key, value = line.chomp.split('=')
#     pairs[key] = value
#   end
#   pairs
# end
# podspec_dir = File.dirname(__FILE__)
# assets_dir = File.join(podspec_dir, '..', 'assets')
# config_file_path = File.join(assets_dir, 'release.config.txt')
# config = read_key_value_pairs.call(config_file_path)

# tag_version = "#{config['TAG_VERSION']}"
# framework = 'libboltz.xcframework'
# lib_name = "libboltz.#{tag_version}"
# url = "#{config['REPOSITORY_URL']}/#{tag_version}/#{lib_name}.zip"
# frameworks_dir = "ios"

# `
# cd ../
# if [ ! -d #{lib_name} ]; then
#   curl -L #{url} -o #{lib_name}.zip
#   unzip #{lib_name}.zip
#   rm -rf __MACOSX
#   rm #{lib_name}.zip
# fi

# if [ ! -d #{frameworks_dir}/#{framework} ]; then
#   cp -R #{lib_name}/#{framework} #{frameworks_dir}
# fi
# `


# Pod::Spec.new do |s|
#   s.name             = 'boltz'
#   s.version          = "#{tag_version}"
#   s.summary          = 'A boltz swap client.'
#   s.description      = <<-DESC
# A boltz swap client
#                        DESC
#   s.license = { :type => 'MIT', :file => '../LICENSE' }
#   s.homepage         = 'https://github.com/SatoshiPortal'
#   s.author           = { 'SatoshiPortal' => 'ishi@satoshiportal.com' }
#   s.source              = { :path => '.' }
#   s.source_files        = 'Classes/**/*'
#   s.public_header_files = 'Classes/**/*.h'

#   s.dependency 'Flutter'
#   s.platform = :ios, '13.0'
#   s.pod_target_xcconfig = {
#     'STRIP_STYLE' => 'non-global', 
#     'DEFINES_MODULE' => 'YES', 
#     'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' 
#   }
#   s.swift_version = '5.0'
#   s.static_framework = true
#   s.vendored_frameworks = "#{framework}"
# end
