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
  s.name                   = "React-RCTBlob"
  s.version                = version
  s.summary                = "An API for displaying iOS action sheets and share sheets."
  s.homepage               = "http://facebook.github.io/react-native/"
  s.license                = package["license"]
  s.author                 = "Facebook, Inc. and its affiliates"
  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
  s.source                 = source
  # RCTBlobCollector.h is not included in the React module as it has C++ code
  s.source_files           = "#{version}/react-native/Libraries/RCTBlob/*.{m,mm}", "#{version}/react-native/Libraries/RCTBlob/RCTBlobCollector.h"
  s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
  s.header_dir             = "RCTBlob"

  s.dependency "React-Core/RCTBlobHeaders", version
  s.dependency "React-Core/RCTWebSocket", version
  s.dependency "React-RCTNetwork", version
  s.dependency "React-jsi", version
end
