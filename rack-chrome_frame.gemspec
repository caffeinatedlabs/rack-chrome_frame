# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "rack-chrome_frame"
  gem.version       = "0.0.1"
  gem.authors       = ["Nate Berkopec"]
  gem.email         = ["nate.berkopec@gmail.com"]
  gem.description   = 'Insert a Chrome Frame install prompt for IE requests'
  gem.summary       = 'Insert a Chrome Frame install prompt for IE requests'
  gem.homepage      = "https://github.com/caffeinatedlabs/rack-chrome_frame"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rack'
  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rack-test'
end
