#
# Be sure to run `pod lib lint BOShareComposer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BOShareComposer'
  s.version          = '0.3.3'
  s.summary          = 'A simple text + URL share composer'
  s.description      = <<-DESC
Composer like share to do custom shares, example: share via direct message twitter they dont have
any composer to send direct messages
                       DESC

  s.homepage         = 'https://github.com/bmoliveira/BOShareComposer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Bruno Oliveira' => 'bm.oliveira.dev@gmail.com' }
  s.source           = { :git => 'https://github.com/bmoliveira/BOShareComposer.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/_bmoliveira'

  s.ios.deployment_target = '8.0'

  s.source_files = 'BOShareComposer/Classes/**/*'

  s.dependency 'SnapKit', '= 0.21.1'
  s.dependency 'Kanna', '~> 1.1'
end
