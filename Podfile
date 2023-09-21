source 'https://github.com/CocoaPods/Specs.git'
source 'https://git.wosai-inc.com/MAPP/sqbapp/sqbpod.git'
         

# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'QuickJS_Test' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'libQuickJS_iOS', '1.0.1'
  pod 'YYKit'



end

post_install do |installer|
     installer.generated_projects.each do |project|
           project.targets.each do |target|
               target.build_configurations.each do |config|
                   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
                end
           end
    end
 end
