Gem::Specification.new do |s|
  s.name          = 'luna_gem'
  s.version       = '0.0.1'
  s.date          = '2016-12-08'
  s.summary       = 'Bloc API Client'
  s.description   = 'A client for the Bloc API'
  s.authors       = ['Luna Kang']
  s.email         = 'luna@example.com'
  s.files         = ['lib/luna_gem.rb']
  s.require_paths = ["lib"]
  s.homepage      =
    'http://rubygems.org/gems/luna_gem'
  s.license       = 'MIT'
  s.add_runtime_dependency 'httparty', '~> 0.13'
end
