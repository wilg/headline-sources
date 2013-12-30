# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'headline_sources/version'

Gem::Specification.new do |spec|
  spec.name          = "headline_sources"
  spec.version       = HeadlineSources::VERSION
  spec.authors       = ["Wil Gieseler"]
  spec.email         = ["wil@wilgieseler.com"]
  spec.description   = "Source headlines for Headline Smasher."
  spec.summary       = "Source headlines for Headline Smasher, and scrapers for them."
  spec.homepage      = "https://github.com/wilg/headline-sources"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_dependency "snoo"
  spec.add_dependency "foreman"
  spec.add_dependency "colorize"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
