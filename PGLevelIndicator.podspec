Pod::Spec.new do |s|
  s.name         = "PGLevelIndicator"
  s.version      = "1.0.0"
  s.summary      = "Fancy and beautiful level indicator component for you awesome apps!"
  s.homepage     = "https://github.com/pablogsIO/PGLevelIndicator"
  s.license      = 'MIT'
  s.author       = "Pablo Garcia"
  s.source       = { :git => "https://github.com/pablogsIO/PGLevelIndicator.git", :tag => s.version }
  s.screenshots   = ['https://raw.githubusercontent.com/pablogsIO/PGLevelIndicator/master/Assets/levelindicator.gif']
  s.platform     = :ios, '10.0'
  s.source_files = 'Source/*.swift'
  s.frameworks   = 'UIKit'
  s.swift_version= '4.0'
  s.requires_arc = true
  s.social_media_url = 'https://twitter.com/_pablogs_'
end
