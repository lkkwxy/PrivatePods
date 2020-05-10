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

Pod::Spec.new do |s|
  s.name                   = "RCTTypeSafety"
  s.version                = version
  s.summary                = "-"  # TODO
  s.homepage               = "http://facebook.github.io/react-native/"
  s.license                = package["license"]
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
  s.compiler_flags         = folly_compiler_flags
  s.source                 = source
  s.source_files           = "#{version}/react-native/Libraries/RCTTypeSafety/**/*.{c,h,m,mm,cpp}"
  s.header_dir             = "#{version}/react-native/Libraries/RCTTypeSafety"
  s.pod_target_xcconfig    = {
                               "USE_HEADERMAP" => "YES",
                               "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
                               "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/Libraries/TypeSafety\" \"$(PODS_ROOT)/Folly\""
                             }

  s.dependency "FBLazyVector", version
  s.dependency "Folly", folly_version
  s.dependency "RCTRequired", version
  s.dependency "React-Core", version
end
