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

Pod::Spec.new do |s|
  s.name                   = "ReactCommon"
  s.module_name            = "ReactCommon"
  s.version                = version
  s.summary                = "-"  # TODO
  s.homepage               = "http://facebook.github.io/react-native/"
  s.license                = package["license"]
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
  s.source                 = source
  s.header_dir             = "ReactCommon" # Use global header_dir for all subspecs for use_framework compatibility
  s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\" \"$(PODS_ROOT)/DoubleConversion\" \"$(PODS_ROOT)/Headers/Private/React-Core\"",
                               "USE_HEADERMAP" => "YES",
                               "CLANG_CXX_LANGUAGE_STANDARD" => "c++14" }

  s.subspec "jscallinvoker" do |ss|
    ss.source_files = "#{version}/react-native/ReactCommon/jscallinvoker/**/*.{cpp,h}"

    ss.dependency "React-cxxreact", version
    ss.dependency "DoubleConversion"
    ss.dependency "Folly", folly_version
    ss.dependency "glog"
  end

  s.subspec "turbomodule" do |ss|
    ss.dependency "ReactCommon/jscallinvoker", version
    ss.dependency "React-Core", version
    ss.dependency "React-cxxreact", version
    ss.dependency "React-jsi", version
    ss.dependency "Folly", folly_version
    ss.dependency "DoubleConversion"
    ss.dependency "glog"

    ss.subspec "core" do |sss|
      sss.source_files = "#{version}/react-native/ReactCommon/turbomodule/core/*.{cpp,h}",
                         "#{version}/react-native/ReactCommon/turbomodule/core/platform/ios/*.{mm,cpp,h}"
    end

    ss.subspec "samples" do |sss|
      sss.source_files = "#{version}/react-native/ReactCommon/turbomodule/samples/*.{cpp,h}",
                         "#{version}/react-native/ReactCommon/turbomodule/samples/platform/ios/*.{mm,cpp,h}"
      sss.dependency "ReactCommon/turbomodule/core", version
    end
  end
end
