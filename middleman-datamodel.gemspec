# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-data_model/version'

Gem::Specification.new do |gem|
  gem.name          = "middleman-data_model"
  gem.version       = Middleman::DataModel::VERSION
  gem.authors       = ["Franklin Webber"]
  gem.email         = ["franklin.webber@gmail.com"]
  gem.description   = %q{Adds simple model support to Middleman.}
  gem.summary       = %q{Middleman has data, but it isn't modeled. Modeling it 
    should be easy. This gem endeavors to make it easy.}
  gem.homepage      = "https://github.com/JumpstartLab/middleman-data_model"
  gem.license       = "MIT"
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
