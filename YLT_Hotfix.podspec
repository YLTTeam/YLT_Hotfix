#
# Be sure to run `pod lib lint YLT_Hotfix.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YLT_Hotfix'
  s.version          = '0.0.2'
  s.summary          = 'YLT_Hotfix.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
iOS线上bug修复，YLT_Hotfix
                       DESC

  s.homepage         = 'https://github.com/YLTTeam/YLT_Hotfix'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xphaijj0305@126.com' => 'xianggong@anve.com' }
  s.source           = { :git => 'https://github.com/YLTTeam/YLT_Hotfix.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YLT_Hotfix/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YLT_Hotfix' => ['YLT_Hotfix/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'JavaScriptCore'
  s.dependency 'YLT_BaseLib'
  s.dependency 'Aspects'
end
