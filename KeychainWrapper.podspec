Pod::Spec.new do |spec|
  spec.platform     = :ios, "12.1"
  spec.ios.deployment_target = '12.1'
  spec.name         = "KeychainWrapper"
  spec.version      = "0.0.3"
  spec.summary      = "Un simple wrapper para el keychain."
  spec.requires_arc = true
  spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.description  = <<-DESC
                      Framework con un conjunto de operaciones que permite usar el keychain de una manera más sencilla   
                      DESC
  spec.homepage     = "https://github.com/migue19/KeychainWrapper"
  spec.author             = { "Miguel Mexicano Herrera" => "miguelmexicano18@gmail.com" }
  spec.source       = { :git => "https://github.com/migue19/KeychainWrapper.git", :tag => "#{spec.version}" }
  spec.source_files  = "KeychainWrapper/**/*.{swift}"
  spec.swift_version = "5.0"
end
