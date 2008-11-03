require File.join(File.dirname(__FILE__), "..", "..", "spec_helper")

describe Yahoo::Service do
  it "should convert a hash to a query string" do
    Yahoo::Service.hash_to_query(:appid => "123", :query => "http://www.rubyskills.com", :results => 100).should == "appid=123&query=http://www.rubyskills.com&results=100"
  end
end