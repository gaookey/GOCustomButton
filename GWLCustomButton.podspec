Pod::Spec.new do |spec|

  spec.name         = "GWLCustomButton"
  spec.version      = "1.0.1"
  spec.summary      = "自定义的UIButton"
  spec.homepage     = "https://gwl.xyz/"
  spec.license      = "MIT"
  spec.author             = { "高文立" => "gao.wenli@foxmail.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/mouos/GWLCustomButton.git", :tag => "#{spec.version}" }
  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"
  spec.public_header_files = "Classes/**/*.h"

end
