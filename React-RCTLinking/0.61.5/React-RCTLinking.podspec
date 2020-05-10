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
  s.name                   = "React-RCTLinking"
  s.version                = version
  s.summary                = "A general interface to interact with both incoming and outgoing app links."
  s.homepage               = "http://facebook.github.io/react-native/"
  s.documentation_url      = "https://facebook.github.io/react-native/docs/linking"
  s.license                = package["license"]
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
  s.source                 = source
  s.source_files           = "#{version}/react-native/Libraries/RCTLinking/*.{m}"
  s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
  s.header_dir             = "#{version}/react-native/Libraries/RCTLinking"

  s.dependency "React-Core/RCTLinkingHeaders", version
end
