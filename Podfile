platform :ios, '7.0'

source 'http://10.17.130.253:9000/gitbucket/git/cocoapods/GitHub_Spec.git'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
        end
    end
end

project 'ImageEditor.xcodeproj'

    target 'ImageEditor' do
        pod 'Masonry'
    end
