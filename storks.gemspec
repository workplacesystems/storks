# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'storks/version'

Gem::Specification.new do |spec|
  spec.name          = "storks"
  spec.version       = Storks::VERSION
  spec.authors       = ["Benjamin Martin"]
  spec.email         = ["benjamin.martin@workplacesystems.com"]
  spec.summary       = 'Simple seeding'
  spec.description   = "Want to apply different 'flavours' of seed data. This gem helps."
  spec.homepage      = 'http://www.workplacesystems.com'
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
end
