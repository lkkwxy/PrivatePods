
Pod::Spec.new do |s|
  s.name         = "RNSmartassets"
  s.version      = "1.0.1"
  s.summary      = "RNSmartassets"
  s.description  = <<-DESC
                  RNSmartassets
                   DESC
  s.homepage     = "https://github.com/lkkwxy/RNSmartassets.git"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/lkkwxy/RNSmartassets.git" }
  s.source_files  = "*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

