# coding: utf-8
# Copyright (c) Facebook, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

require "json"

package = {
  "version"=>"0.61.5",
  "description"=>"A framework for building native apps using React",
  "license"=>"MIT"
}
version = package['version']

source = { :git => 'https://github.com/lkkwxy/ReactNative.git' }

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'
folly_version = '2018.10.22.00'
boost_compiler_flags = '-Wno-documentation'

header_subspecs = {
  'ARTHeaders'                  => '#{version}/react-native/Libraries/ART/**/*.h',
  'CoreModulesHeaders'          => '#{version}/react-native/React/CoreModules/**/*.h',
  'RCTActionSheetHeaders'       => 'Libraries/ActionSheetIOS/*.h',
  'RCTAnimationHeaders'         => '#{version}/react-native/Libraries/NativeAnimation/{Drivers/*,Nodes/*,*}.{h}',
  'RCTBlobHeaders'              => '#{version}/react-native/Libraries/Blob/{RCTBlobManager,RCTFileReaderModule}.h',
  'RCTImageHeaders'             => '#{version}/react-native/Libraries/Image/*.h',
  'RCTLinkingHeaders'           => "#{version}/react-native/Libraries/LinkingIOS/*.h",
  'RCTNetworkHeaders'           => '#{version}/react-native/Libraries/Network/*.h',
  'RCTPushNotificationHeaders'  => '#{version}/react-native/Libraries/PushNotificationIOS/*.h',
  'RCTSettingsHeaders'          => '#{version}/react-native/Libraries/Settings/*.h',
  'RCTTextHeaders'              => "#{version}/react-native/Libraries/Text/**/*.h",
  'RCTVibrationHeaders'         => '#{version}/react-native/Libraries/Vibration/*.h',
}

Pod::Spec.new do |s|
  s.name                   = "React-Core"
  s.version                = version
  s.summary                = "The core of React Native."
  s.homepage               = "http://facebook.github.io/react-native/"
  s.license                = package["license"]
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
  s.source                 = source
  s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
  s.header_dir             = "React"
  s.framework              = "JavaScriptCore"
  s.library                = "stdc++"
  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/DoubleConversion\" \"$(PODS_ROOT)/Folly\"" }
  s.user_target_xcconfig   = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/Headers/Private/React-Core\""}
  s.default_subspec        = "Default"

  s.subspec "Default" do |ss|
    ss.source_files           = "#{version}/react-native/React/**/*.{c,h,m,mm,S,cpp}"
    ss.exclude_files          = "#{version}/react-native/React/CoreModules/**/*",
                                "#{version}/react-native/React/DevSupport/**/*",
                                "#{version}/react-native/React/Fabric/**/*",
                                "#{version}/react-native/React/Inspector/**/*"
    ss.ios.exclude_files      = "#{version}/react-native/React/**/RCTTV*.*"
    ss.tvos.exclude_files     = "#{version}/react-native/React/Modules/RCTClipboard*",
                                "#{version}/react-native/React/Views/RCTDatePicker*",
                                "#{version}/react-native/React/Views/RCTPicker*",
                                "#{version}/react-native/React/Views/RCTRefreshControl*",
                                "#{version}/react-native/React/Views/RCTSlider*",
                                "#{version}/react-native/React/Views/RCTSwitch*",
    ss.private_header_files   = "#{version}/react-native/React/Cxx*/*.h"
  end

  s.subspec "DevSupport" do |ss|
    ss.source_files = "#{version}/react-native/React/DevSupport/*.{h,mm,m}",
                      "#{version}/react-native/React/Inspector/*.{h,mm,m}"

    ss.dependency "React-Core/Default", version
    ss.dependency "React-Core/RCTWebSocket", version
    ss.dependency "React-jsinspector", version
  end

  s.subspec "RCTWebSocket" do |ss|
    ss.source_files = "#{version}/react-native/Libraries/WebSocket/*.{h,m}"
    ss.dependency "React-Core/Default", version
  end

  # Add a subspec containing just the headers for each
  # pod that should live under <React/*.h>
  header_subspecs.each do |name, headers|
    s.subspec name do |ss|
      ss.source_files = headers
      ss.dependency "React-Core/Default"
    end
  end

  s.dependency "Folly", folly_version
  s.dependency "React-cxxreact", version
  s.dependency "React-jsi", version
  s.dependency "React-jsiexecutor", version
  s.dependency "Yoga"
  s.dependency "glog"
end
