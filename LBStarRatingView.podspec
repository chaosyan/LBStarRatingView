
Pod::Spec.new do |s|



  s.name         = "LBStarRatingView"
  s.version      = "0.0.3"
  s.summary      = "LBStarRatingView 简单有效的 评价小星星 的 控件 "

  s.homepage     = "https://github.com/chaosyan/LBStarRatingView"


  s.license      = "MIT"

  s.author             = { "chaosyan" => "578218354@qq.com" }

  s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/chaosyan/LBStarRatingView.git", :tag => "#{s.version}" }

  s.source_files  =  "LBStarRatingView/*"

  s.resources = "LBStarRatingView/**/*.png"

  s.requires_arc = true

end
