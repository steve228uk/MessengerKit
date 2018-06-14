#
# Be sure to run `pod lib lint MessengerKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MessengerKit'
  s.version          = '1.0.0'
  s.summary          = 'A UI framework for building messenger interfaces on iOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
MessengerKit is a drop-in UI for messenger interfaces on iOS built in Swift. Centred around a single `UIViewController`, MessengerKit is themeable to fit your needs and includes a number of powerful features:

- `UICollectionView` based with pre-loading and caching of size calculation for bubbles.
- Auto-growing input view.
- Multiple included cell types: text, large-emoji, image, video.
- Presentation of `SFSafariViewController`
- Built-in, customisable themes.
- A custom theming system to bring your own `UICollectionViewCell`s, headers, footers, and input views.
- Avatar support (currently only in the `travamigos` theme).

The framework was built for and is used in production at [Travamigos](https://travamigos.com).
                       DESC

  s.homepage         = 'https://github.com/steve228uk/MessengerKit'
  s.screenshots      = https://github.com/steve228uk/MessengerKit/blob/master/readme-resources/screenshots/examples.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'steve228uk' => 'steve228uk@gmail.com' }
  s.source           = { :git => 'https://github.com/steve228uk/MessengerKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/steve228uk'

  s.ios.deployment_target = '10.0'

  s.source_files = ['MessengerKit/**/*.{h,m,swift}']
  s.resource_bundle = { 'MessengerKit' => 'MessengerKit/**/*.{xcassets,xib,nib}' }
  
end
