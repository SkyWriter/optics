# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'optics/version'

Gem::Specification.new do |spec|
  spec.name          = "optics"
  spec.version       = Optics::VERSION
  spec.authors       = ["Ivan Kasatenko"]
  spec.email         = ["sky.31338@gmail.com"]

  spec.summary       = %q{A humble attempt at creating a set of functional optics for Ruby}
  spec.description   = %q{Missing Ruby implementation of functional optics}
  spec.homepage      = "https://github.com/SkyWriter/optics"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
