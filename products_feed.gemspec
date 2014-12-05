# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'products_feed'
  s.version     = '0.0.3'
  s.summary     = 'Add gem summary here'
  s.description = 'Add (optional) gem description here'
  s.required_ruby_version = '>= 1.9.3'

  s.authors    = ['Andrea Pavoni', 'Alessio Rocco']
  s.email     = 'info@nebulab.it'
  s.homepage  = 'http://nebulab.it'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'builder'
  s.add_dependency 'fog'

  s.add_development_dependency 'nokogiri'
  s.add_development_dependency 'rspec',  '~> 3.1'
  s.add_development_dependency 'simplecov'
end
