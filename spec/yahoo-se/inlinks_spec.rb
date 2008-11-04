require File.join(File.dirname(__FILE__), "..", "..", "spec_helper")

describe Yahoo::SE::Inlinks do
  before do
    @result1 = mock(Yahoo::SE::Result)
    @request = mock(Yahoo::SE::Request, :results => [@result1])
  end
  
  it "should have the service path for the inlinks service" do
    Yahoo::SE::Inlinks::SERVICE_PATH.should == "http://search.yahooapis.com/SiteExplorerService/V1/inlinkData"
  end
  
  it "should return 100 inlink results" do
    Yahoo::SE.application_id = "123"
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/inlinkData", {:results=>100, :query=>"rubyskills.com"}).and_return(@request)
    Yahoo::SE.inlinks("rubyskills.com", :results => 100)
  end
end