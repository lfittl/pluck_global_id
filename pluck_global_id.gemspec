# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pluck_global_id/version'

Gem::Specification.new do |spec|
  spec.name          = "pluck_global_id"
  spec.version       = PluckGlobalID::VERSION
  spec.authors       = ["Lukas Fittl"]
  spec.email         = ["lukas@fittl.com"]
  spec.summary       = %q{Get GlobalIDs from an ActiveRecord scope without instantiating AR objects}
  spec.description   = ''
  spec.homepage      = 'https://github.com/lfittl/pluck_global_id'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activerecord", ">= 4.0"
  spec.add_runtime_dependency "railties", ">= 4.0"
  spec.add_runtime_dependency "globalid", "~> 0.3.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "sqlite3"
end
