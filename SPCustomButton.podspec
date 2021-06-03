Pod::Spec.new do |spec|

  spec.name                = "SPCustomButton"
  spec.version             = "1.0.7"
  spec.summary             = "A simple custom button."
  spec.homepage            = "https://github.com/gaookey/SPCustomButton"
  spec.license             = "MIT"
  spec.author              = { "高文立" => "gaookey@gmail.com" }
  spec.platform            = :ios, "10.0"
  spec.source              = { :git => "https://github.com/gaookey/SPCustomButton.git", :tag => "#{spec.version}" }
  spec.source_files        = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files       = "Classes/Exclude"
  spec.public_header_files = "Classes/**/*.h"

end
