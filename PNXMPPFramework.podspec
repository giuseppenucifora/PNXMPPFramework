#
# Be sure to run `pod lib lint PNXMPPFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PNXMPPFramework"
  s.version          = "0.1.0"
  s.summary          = "PNXMPPFramework is a fork of original framework https://github.com/robbiehanson/XMPPFramework with KissXML and CocoaAsyncSocket upgrade"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
#s.description      = <<-DESC                       DESC

  s.homepage         = "https://github.com/giuseppenucifora/PNXMPPFramework"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Giuseppe Nucifora" => "me@giuseppenucifora.com" }
  s.source           = { :git => "https://github.com/giuseppenucifora/PNXMPPFramework.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resources = [ '**/*.{xcdatamodel,xcdatamodeld}']
  s.resource_bundles = {
    'PNXMPPFramework' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.preserve_paths = "PNXMPPFramework/Vendor/libidn/"
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'


s.preserve_path = 'PNXMPPFramework/module/module.modulemap'
#s.module_map = 'module/module.modulemap'

s.subspec 'Core' do |core|
core.source_files = ['XMPPFramework.h', 'Core/**/*.{h,m}', 'Authentication/**/*.{h,m}', 'Categories/**/*.{h,m}', 'Utilities/**/*.{h,m}']
core.libraries = 'xml2', 'resolv'
core.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(inherited) $(SDKROOT)/usr/include/libxml2 $(PODS_ROOT)/XMPPFramework/module $(SDKROOT)/usr/include/libresolv', 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES', 'OTHER_LDFLAGS' => '"-lxml2"', 'ENABLE_BITCODE' => 'NO'
}
core.dependency 'CocoaLumberjack','~>1.9'
core.dependency 'CocoaAsyncSocket'
core.dependency 'KissXML'
core.dependency 'libidn'
end

s.subspec 'Authentication' do |ss|
ss.dependency 'PNXMPPFramework/Core'
end

s.subspec 'Categories' do |ss|
ss.dependency 'PNXMPPFramework/Core'
end

s.subspec 'Utilities' do |ss|
ss.dependency 'PNXMPPFramework/Core'
end

s.subspec 'BandwidthMonitor' do |ss|
ss.source_files = 'Extensions/BandwidthMonitor/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'CoreDataStorage' do |ss|
ss.source_files = ['Extensions/CoreDataStorage/**/*.{h,m}', 'Extensions/XEP-0203/NSXMLElement+XEP_0203.h']
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
ss.framework = 'CoreData'
end

s.subspec 'GoogleSharedStatus' do |ss|
ss.source_files = 'Extensions/GoogleSharedStatus/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'ProcessOne' do |ss|
ss.source_files = 'Extensions/ProcessOne/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'Reconnect' do |ss|
ss.source_files = 'Extensions/Reconnect/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
ss.framework = 'SystemConfiguration'
end

s.subspec 'Roster' do |ss|
ss.source_files = 'Extensions/Roster/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.dependency 'PNXMPPFramework/CoreDataStorage'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'SystemInputActivityMonitor' do |ss|
ss.source_files = ['Extensions/SystemInputActivityMonitor/**/*.{h,m}', 'Utilities/GCDMulticastDelegate.h']
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0009' do |ss|
ss.source_files = 'Extensions/XEP-0009/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0012' do |ss|
ss.source_files = 'Extensions/XEP-0012/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0016' do |ss|
ss.source_files = 'Extensions/XEP-0016/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0045' do |ss|
ss.source_files = 'Extensions/XEP-0045/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.dependency 'PNXMPPFramework/CoreDataStorage'
ss.dependency 'PNXMPPFramework/XEP-0203'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0054' do |ss|
ss.source_files = ['Extensions/XEP-0054/**/*.{h,m}', 'Extensions/XEP-0153/XMPPvCardAvatarModule.h', 'Extensions/XEP-0082/XMPPDateTimeProfiles.h', 'Extensions/XEP-0082/NSDate+XMPPDateTimeProfiles.h']
ss.dependency 'PNXMPPFramework/Core'
ss.dependency 'PNXMPPFramework/Roster'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
ss.framework = 'CoreLocation'
end

s.subspec 'XEP-0059' do |ss|
ss.source_files = 'Extensions/XEP-0059/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0060' do |ss|
ss.source_files = 'Extensions/XEP-0060/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0065' do |ss|
ss.source_files = 'Extensions/XEP-0065/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0066' do |ss|
ss.source_files = 'Extensions/XEP-0066/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0082' do |ss|
ss.source_files = 'Extensions/XEP-0082/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0085' do |ss|
ss.source_files = 'Extensions/XEP-0085/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0092' do |ss|
ss.source_files = 'Extensions/XEP-0092/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0100' do |ss|
ss.source_files = 'Extensions/XEP-0100/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0106' do |ss|
ss.source_files = 'Extensions/XEP-0106/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0115' do |ss|
ss.source_files = 'Extensions/XEP-0115/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.dependency 'PNXMPPFramework/CoreDataStorage'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0136' do |ss|
ss.source_files = 'Extensions/XEP-0136/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/CoreDataStorage'
ss.dependency 'PNXMPPFramework/XEP-0203'
ss.dependency 'PNXMPPFramework/XEP-0085'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0153' do |ss|
ss.source_files = ['Extensions/XEP-0153/**/*.{h,m}', 'Extensions/XEP-0082/NSDate+XMPPDateTimeProfiles.h']
ss.dependency 'PNXMPPFramework/Core'
ss.dependency 'PNXMPPFramework/XEP-0054'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0172' do |ss|
ss.source_files = 'Extensions/XEP-0172/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0184' do |ss|
ss.source_files = 'Extensions/XEP-0184/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0191' do |ss|
ss.source_files = 'Extensions/XEP-0191/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0198' do |ss|
ss.source_files = 'Extensions/XEP-0198/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0199' do |ss|
ss.source_files = 'Extensions/XEP-0199/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0202' do |ss|
ss.source_files = 'Extensions/XEP-0202/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.dependency 'PNXMPPFramework/XEP-0082'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0203' do |ss|
ss.source_files = 'Extensions/XEP-0203/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.dependency 'PNXMPPFramework/XEP-0082'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0223' do |ss|
ss.source_files = 'Extensions/XEP-0223/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0224' do |ss|
ss.source_files = 'Extensions/XEP-0224/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0280' do |ss|
ss.source_files = ['Extensions/XEP-0280/**/*.{h,m}', 'Extensions/XEP-0297/NSXMLElement+XEP_0297.h']
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0297' do |ss|
ss.source_files = ['Extensions/XEP-0297/**/*.{h,m}', 'Extensions/XEP-0203/**/*.h']
ss.dependency 'PNXMPPFramework/Core'
ss.dependency 'PNXMPPFramework/XEP-0203'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0308' do |ss|
ss.source_files = 'Extensions/XEP-0308/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0333' do |ss|
ss.source_files = 'Extensions/XEP-0333/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end

s.subspec 'XEP-0335' do |ss|
ss.source_files = 'Extensions/XEP-0335/**/*.{h,m}'
ss.dependency 'PNXMPPFramework/Core'
ss.prefix_header_contents = "#define HAVE_XMPP_SUBSPEC_#{name.upcase.sub('-', '_')}"
end
end
