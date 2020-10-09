Pod::Spec.new do |spec|
  spec.platform = :ios
  spec.ios.deployment_target = '12.0'
  spec.name         = "KeychainWrapper"
  spec.version      = "0.0.1"
  spec.summary      = "Un simple wrapper para el keychain."
  spec.requires_arc = true
  s.license = { :type => "MIT", :file => "LICENSE" }
  spec.description  = <<-DESC
                   DESC
  spec.homepage     = "https://github.com/migue19/KeychainWrapper"
  spec.license      = "MIT (example)"
  spec.author             = { "Miguel Mexicano Herrera" => "miguelmexicano18@gmail.com" }
  spec.source       = { :git => "https://github.com/migue19/KeychainWrapper.git", :tag => "#{spec.version}" }
  spec.source_files  = "RWPickFlavor/**/*.{swift}"
  spec.swift_version = "4.2"
end
