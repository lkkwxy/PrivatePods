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
  s.name                   = "React-RCTImage"
  s.version                = version
  s.summary                = "A React component for displaying different types of images."
  s.homepage               = "http://facebook.github.io/react-native/"
  s.documentation_url      = "https://facebook.github.io/react-native/docs/image"
  s.license                = package["license"]
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
  s.source                 = source
  s.source_files           = "#{version}/react-native/Libraries/Image/*.{m}"
  s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
  s.header_dir             = "RCTImage"

  s.dependency "React-Core/RCTImageHeaders", version
  s.dependency "React-RCTNetwork", version
end
