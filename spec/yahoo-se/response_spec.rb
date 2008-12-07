require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Yahoo::SE::Response do
  before do
    @response = Yahoo::SE::Response.new(fixture("erbmicha.com_backlinks.json"))
  end
  
  it "should list 100 result objects" do
    @response.results.size.should equal(100)
  end
  
  it "should show the total results return from the request" do
    @response.total_results_returned.should == 100
  end
  
  it "should show the total results found from Yahoo!" do
    @response.total_results_available.should == 328
  end
  
  describe "Errors" do
    it "should raise an exception if the response is a exceed error" do
      @response = Yahoo::SE::Response.new(fixture("exceed_error.json"))
      lambda { @response.results }.should raise_error(Yahoo::SE::ResponseError)
    end
  end
end