# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/logg/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-logg"
  spec.version       = Omniauth::Logg::VERSION
  spec.authors       = ["Blake Petetan"]
  spec.email         = ["blake@synctree.com"]
  spec.summary       = "LOGG strategy for OmniAuth"
  spec.homepage      = "http://logg.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
