# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "ocelots"
  gem.version       = '0.0.1'
  gem.authors       = ["Mark Ryall"]
  gem.email         = ["mark@ryall.name"]
  gem.description   = %q{Command line wrapper for ocelots api}
  gem.summary       = <<-EOF
  This gem encapsulates usage of the ocelots api and provides a command line
  interface.
  EOF
  gem.homepage      = "http://github.com/ocelots/ocelots_gem"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'httparty'
  gem.add_development_dependency 'rake'
end
