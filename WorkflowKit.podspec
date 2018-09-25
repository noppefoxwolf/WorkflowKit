#
# Be sure to run `pod lib lint WorkflowKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WorkflowKit'
  s.version          = '0.1.0'
  s.summary          = 'Library for shortcut app files.'
  s.description      = <<-DESC
Library for shortcut app files.
                       DESC

  s.homepage         = 'https://github.com/noppefoxwolf/WorkflowKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'noppefoxwolf' => 'noppelabs@gmail.com' }
  s.source           = { :git => 'https://github.com/noppefoxwolf/WorkflowKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/noppefoxwolf'
  s.ios.deployment_target = '12.0'
  s.source_files = 'WorkflowKit/Classes/**/*'
  s.swift_version = '4.2'
end
