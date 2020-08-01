#
# Be sure to run `pod lib lint AllowX.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AllowX'
  s.version          = '0.1.0'
  s.summary          = 'AllowX to ask for permissions on iOS ❓👀.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
AllowX is a zero setup and unified API to ask for permissions on iOS ❓👀.
                       DESC

  s.homepage         = 'https://github.com/KarimEbrahemAbdelaziz/AllowX'
  s.screenshots = 'https://github.com/KarimEbrahemAbdelaziz/AllowX/blob/master/Screenshots/3.png?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'KarimEbrahemAbdelaziz' => 'karimabdelazizmansour@gmail.com' }
  s.source           = { :git => 'https://github.com/KarimEbrahemAbdelaziz/AllowX.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/KarimEbrahem512'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'

  s.source_files = 'AllowX/Classes/**/*'
  s.resources = 'AllowX/Assets/*'
  
  s.frameworks = 'UIKit'
  s.dependency 'SwiftEntryKit', '1.2.3'
end
