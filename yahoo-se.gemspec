require 'lib/yahoo/site_explorer/version'

Gem::Specification.new do |s|
  s.name = "yahoo-se"
  s.version = Yahoo::SE::VERSION
  s.date = "2008-11-03"
  s.summary = "Ruby gem for yahoo site explorer"
  s.email = "info@rubyskills.com"
  s.homepage = "http://www.rubyskills.com"
  s.authors = ["Lance Carlson"]
  s.files = ['bossman.gemspec', 'lib/yahoo/se.rb', 'README', 'LICENSE']
  # s.add_dependency("activesupport", [">= 2.1.0"])
  s.has_rdoc = false
end