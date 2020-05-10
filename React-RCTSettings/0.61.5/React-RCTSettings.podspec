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

Pod::Spec.new do |s|
  s.name                   = "React-RCTSettings"
  s.version                = version
  s.summary                = "A wrapper for NSUserDefaults, a persistent key-value store available only on iOS." 
  s.homepage               = "http://facebook.github.io/react-native/"
  s.documentation_url      = "https://facebook.github.io/react-native/docs/settings"
  s.license                = package["license"]
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
  s.source                 = source
  s.source_files           = "#{version}/react-native/Libraries/RCTSettings*.{m}"
  s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
  s.header_dir             = "#{version}/react-native/Libraries/RCTSettings"

  s.dependency "React-Core/RCTSettingsHeaders", version
end
