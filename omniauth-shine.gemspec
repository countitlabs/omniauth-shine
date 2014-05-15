$:.push File.expand_path("../lib", __FILE__)
require "omniauth-shine/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-shine"
  s.version     = OmniAuth::Shine::VERSION
  s.authors     = ["Mathias Kolehmainen"]
  s.email       = ["mathias@countit.com"]
  s.homepage    = "https://github.com/socialworkout/omniauth-shine"
  s.summary     = %q{Misfit Shine strategy for OmniAuth.}
  s.description = %q{Misfit Shine strategy for OmniAuth.}
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  # s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'

  # s.add_development_dependency 'rspec', '~> 2.7'
end

