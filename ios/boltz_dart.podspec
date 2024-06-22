read_key_value_pairs = lambda do |file_path|
  pairs = {}
  File.foreach(file_path) do |line|
    key, value = line.chomp.split('=')
    pairs[key] = value
  end
  pairs
end
podspec_dir = File.dirname(__FILE__)
assets_dir = File.join(podspec_dir, '..', 'assets')
config_file_path = File.join(assets_dir, 'release.config.txt')
config = read_key_value_pairs.call(config_file_path)

tag_version = "#{config['TAG_VERSION']}"
framework = 'libboltz.xcframework'
lib_name = "libboltz.#{tag_version}"
url = "#{config['REPOSITORY_URL']}#{tag_version}/#{lib_name}.zip"
frameworks_dir = "ios"

`
cd ../
if [ ! -d #{lib_name} ]; then
    curl -L #{url} -o #{lib_name}.zip
    unzip #{lib_name}.zip
    rm -rf __MACOSX
    rm #{lib_name}.zip
fi

if [ ! -d #{frameworks_dir}/#{framework} ]; then
        cp -R #{lib_name}/#{framework} #{frameworks_dir}
fi
`

#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint boltz_dart.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'boltz_dart'
  s.version          = "#{tag_version}"
  s.summary          = 'A boltz swap client.'
  s.description      = <<-DESC
A boltz swap client
                       DESC
  s.license          = { :file => '../LICENSE' }
  s.homepage         = 'https://github.com/SatoshiPortal'
  s.author           = { 'SatoshiPortal' => 'ishi@satoshiportal.com' }
  s.source           = { :http => "#{url}" }

  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.swift_version = '5.0'
  s.public_header_files = 'Classes**/*.h'
  s.source_files = 'Classes/**/*'
  s.static_framework = false
  s.vendored_frameworks = "#{framework}"

  # # This will ensure the source files in Classes/ are included in the native
  # # builds of apps using this FFI plugin. Podspec does not support relative
  # # paths, so Classes contains a forwarder C file that relatively imports
  # # `../src/*` so that the C sources can be shared among all target platforms.
  # s.source           = { :path => '.' }
  # s.source_files = 'Classes/**/*'
  # s.public_header_files = 'Classes**/*.h'
  # s.dependency 'Flutter'
  # s.platform = :ios, '11.0'

  # # Flutter.framework does not contain a i386 slice.
  # s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  # s.swift_version = '5.0'
end
