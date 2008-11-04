dist_dirs = [ "lib", "spec" ]

Gem::Specification.new do |s|
  s.name = "yahoo-se"
  s.version = "0.0.2"
  s.date = "2008-11-03"
  s.summary = "Ruby gem for yahoo site explorer"
  s.email = "info@rubyskills.com"
  s.homepage = "http://www.rubyskills.com"
  s.authors = ["Lance Carlson"]
  s.files = ['yahoo-se.gemspec', 'README', 'LICENSE']
  dist_dirs.each do |dir|
    s.files = s.files + Dir.glob("#{dir}/**/*")
  end
  # s.add_dependency("activesupport", [">= 2.1.0"])
  s.has_rdoc = false
end