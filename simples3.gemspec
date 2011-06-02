# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "simples3/version"

Gem::Specification.new do |s|
  s.name        = "simples3"
  s.version     = Simples3::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Forrest Grant"]
  s.email       = ["forrest@forrestgrant.com"]
  s.homepage    = ""
  s.summary     = %q{Makes AWS::S3 Calls simpler}
  s.description = %q{Simple Wrapper for AWS::S3}

  s.rubyforge_project = "simples3"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_runtime_dependency(%q<aws-s3>, [">= 0"])
end
