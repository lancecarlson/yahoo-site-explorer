Gem::Specification.new do |s|
  s.name = "yahoo-se"
  s.version = "0.0.2"
  s.date = "2008-11-03"
  s.summary = "Ruby gem for yahoo site explorer"
  s.email = "info@rubyskills.com"
  s.homepage = "http://www.rubyskills.com"
  s.authors = ["Lance Carlson"]
  s.files = [
    'LICENSE',
    'Rakefile',
    'README', 
    'lib/yahoo-se.rb', 
    'lib/yahoo-se/inlinks.rb',
    'lib/yahoo-se/pages.rb',
    'lib/yahoo-se/request.rb',
    'lib/yahoo-se/response.rb',
    'lib/yahoo-se/result.rb',
    'lib/yahoo-se/version.rb',
    'spec/fixtures/erbmicha.com_backlinks.json',
    'spec/fixtures/erbmicha.com_pages.json', 
    'spec/spec.opts',
    'spec/spec_helper.rb',
    'spec/yahoo-se/inlinks_spec.rb',
    'spec/yahoo-se/pages_spec.rb',
    'spec/yahoo-se/request_spec.rb',
    'spec/yahoo-se/response_spec.rb',
    'spec/yahoo-se/result_spec.rb',
    'spec/yahoo-se_spec.rb'
    ]
  s.require_path = "lib"
  # s.add_dependency("activesupport", [">= 2.1.0"])
  s.has_rdoc = false
end