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
url = "#{config['REPOSITORY_URL']}/#{tag_version}/#{lib_name}.zip"
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


Pod::Spec.new do |s|
  s.name             = 'boltz_dart'
  s.version          = "#{tag_version}"
  s.summary          = 'A boltz swap client.'
  s.description      = <<-DESC
A boltz swap client
                       DESC
  s.license = { :type => 'MIT', :file => '../LICENSE' }
  s.homepage         = 'https://github.com/SatoshiPortal'
  s.author           = { 'SatoshiPortal' => 'ishi@satoshiportal.com' }
  s.source              = { :path => '.' }
  s.source_files        = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  s.dependency 'Flutter'
  s.platform = :ios, '12'

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' 
  }
  s.user_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }  
  s.swift_version = '5.0'
  s.static_framework = true
  s.vendored_frameworks = "#{frameworks_dir}/#{framework}"
end
