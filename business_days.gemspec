# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'business_days/version'

Gem::Specification.new do |spec|
  spec.name          = "business_days"
  spec.version       = BusinessDays::VERSION
  spec.authors       = ["Burke Libbey", "Evan Petrie"]
  spec.email         = ["burke@libbey.me", "evan@peerstreet.com"]
  spec.summary       = %q{Business Days is a sort-of extension to ActiveSupport to allow adding business days to time objects.}

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 2.3"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
end
