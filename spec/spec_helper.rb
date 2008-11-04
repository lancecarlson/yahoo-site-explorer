# Ensure that only the source is getting tested and not the installed gem
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

RAILS_ENV = "test"

require "rubygems"
require "test/unit"
require "spec"
require File.join(File.dirname(__FILE__), "..", "lib", "yahoo", "se")


Spec::Runner.configure do |config| 
end

def fixtures_path(path)
  File.expand_path(File.join(File.dirname(__FILE__), "fixtures", path))
end