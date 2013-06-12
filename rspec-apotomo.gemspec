# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rspec-apotomo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nick Sutterer", "Christian Holtje", "Jake Goulding"]
  gem.email         = ["apotonick@gmail.com", "docwhat@gerf.org", "jake.goulding@gmail.com"]
  gem.description   = %q{Use render_widget in your specs}
  gem.summary       = %q{Spec your widgets}
  gem.homepage      = "http://rubygems.org/gems/rspec-apotomo"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "rspec-apotomo"
  gem.require_paths = ["lib"]
  gem.version       = Rspec::Apotomo::VERSION

  gem.add_runtime_dependency('rails', ['>= 3.0'])
  gem.add_runtime_dependency('rspec-rails', ['~> 2.6'])
  gem.add_runtime_dependency('apotomo', ['>= 1.1.4'])

  gem.add_development_dependency('capybara')
  gem.add_development_dependency('generator_spec')
end
