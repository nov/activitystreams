Gem::Specification.new do |s|
  s.name        = "activitystreams"
  s.version     = File.read("VERSION")
  s.authors     = ["nov matake"]
  s.email       = ["nov@matake.jp"]
  s.homepage    = "http://github.com/nov/activitystreams"
  s.summary     = %q{A RubyGem for ActivityStreams Publishers}
  s.description = %q{A RubyGem for ActivityStreams Publishers}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_runtime_dependency "json", ">= 1.4.3"
  s.add_runtime_dependency "activesupport", ">= 2.3"
  s.add_runtime_dependency "i18n"
  s.add_runtime_dependency "attr_required", ">= 0.0.3"
  s.add_runtime_dependency "addressable"
  s.add_development_dependency "rake", ">= 0.8"
  s.add_development_dependency "rcov", ">= 0.9"
  s.add_development_dependency "rspec", ">= 2"
end
