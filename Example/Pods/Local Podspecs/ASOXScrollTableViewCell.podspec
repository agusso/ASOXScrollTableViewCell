Pod::Spec.new do |s|
  s.name             = "ASOXScrollTableViewCell"
  s.version          = "0.1.0"
  s.summary          = "Horizontal scroll table view cell"
  s.description      = "An easy-to-configure horizontal scroll table view cell."
  s.homepage         = "https://github.com/agusso/ASOXScrollTableViewCell"
  s.license          = 'MIT'
  s.author           = { "Agus Soedibjo" => "contact@soedibjo.com" }
  s.source           = { :git => "https://github.com/agusso/ASOXScrollTableViewCell.git", :tag => "0.1.0" }

  s.platform     = :ios, '7.1'
  s.requires_arc = true
  s.source_files = "Pod/Classes"
end
