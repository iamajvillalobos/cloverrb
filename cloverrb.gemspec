# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cloverrb/version"

Gem::Specification.new do |spec|
  spec.name          = "cloverrb"
  spec.version       = Cloverrb::VERSION
  spec.authors       = ["Arman Jon Villalobos"]
  spec.email         = ["me@armanjon.com"]

  spec.summary       = %q{Ruby wrapper for Clover API}
  spec.description   = %q{Ruby wrapper for Clover API}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "dotenv"

  spec.add_dependency "httparty"
  spec.add_dependency "activesupport"
end
