Pod::Spec.new do |s|
  s.name         = "RiotKit"
  s.version      = "0.0.2"
  s.summary      = "An Objective-C wrapper for the Riot Games Developer API."
  s.homepage     = "https://github.com/stillmotion/RiotKit"
  s.license      = "MIT"
  s.author             = { "Levi McCallum" => "levi@levimccallum.com" }
  s.social_media_url   = "http://twitter.com/levi"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/stillmotion/RiotKit.git", :tag => "0.0.2" }
  s.source_files  = "Classes/**/*.{h,m}"
  s.public_header_files = "Classes/**/*.h"
  s.requires_arc = true
end
