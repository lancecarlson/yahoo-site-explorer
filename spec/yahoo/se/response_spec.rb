require File.join(File.dirname(__FILE__), "..", "..", "spec_helper")

describe Yahoo::SE::Response do
  before do
    @response = Yahoo::SE::Response.new(fixture("yahoo/se/erbmicha.com_backlinks.json"))
  end
  
  it "should " do
    @response.results.should == "test"
  end
end