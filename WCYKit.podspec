#
# Be sure to run `pod lib lint WCYKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WCYKit'
  s.version          = '1.1.2'
  s.summary          = 'A fairly complete class of common tools and extensions tool'

  s.description      = <<-DESC
                        'In development, we often package some commonly used tools and extensions to improve the development speed, this is my recent years in different project development commonly used features of some summary, including commonly used tool classes and extensions, similar to YYKit, but I feel that he is too functional, and it does not have some common tool class encapsulation. So I sorted out and summarized the common features and tools I encountered in my daily development, and that is the WCYKit now.'
                        DESC

  s.homepage         = 'https://github.com/WeiCY/WCYKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'WeiCY' => 'weicy@citydo.com.cn' }
  s.source           = { :git => 'https://github.com/1690014290@qq.com/WCYKit.git', :tag => s.version }
  s.social_media_url = 'https://www.cnblogs.com/weicyNo-1/'

  s.ios.deployment_target = '9.0'

  s.source_files = 'WCYKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WCYKit' => ['WCYKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
