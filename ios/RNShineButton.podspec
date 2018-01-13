
Pod::Spec.new do |s|
  s.name         = "RNShineButton"
  s.version      = "1.0.0"
  s.summary      = "RNShineButton"
  s.description  = <<-DESC
                  RNShineButton
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNShineButton.git", :tag => "master" }
  s.source_files  = "RNShineButton/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  