# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "avtq_highrise/version"

Gem::Specification.new do |s|
  s.name        = "avtq_highrise"
  s.version     = AvtqHighrise::VERSION
  s.authors     = ["Julian Fischer"]
  s.email       = ["fischer@enterprise-rails.de"]
  s.homepage    = ""
  s.summary     = %q{TODO: Helps to push leads into highrise.}
  s.description = %q{TODO: Common! What else do you need to know?}

  s.rubyforge_project = "avtq_highrise"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "activeresource"
  
  s.add_development_dependency "minitest"
  s.add_development_dependency "colorize"
end
