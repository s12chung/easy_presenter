# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easy_presenter/version'

Gem::Specification.new do |spec|
  spec.name          = "easy_presenter"
  spec.version       = EasyPresenter::VERSION
  spec.authors       = ["s12chung"]
  spec.email         = ["steve.chung7@gmail.com"]
  spec.description   = "Access view methods in your models."
  spec.summary       = "Access view methods in your models."
  spec.homepage      = "https://github.com/s12chung/easy_presenter"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', '>= 3.2'
  spec.add_dependency 'request_store'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'sqlite3'
end
