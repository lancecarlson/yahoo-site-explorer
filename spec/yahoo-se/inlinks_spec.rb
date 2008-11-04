require File.join(File.dirname(__FILE__), "..", "spec_helper")

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
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/inlinkData", {:results=>100, :query=>"http://rubyskills.com", :start => 1}).and_return(@request)
    Yahoo::SE.inlinks("http://rubyskills.com", :results => 100).results
  end
  
  it "should return the next 75 inlink results" do
    Yahoo::SE.application_id = "123"
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/inlinkData", {:results=>75, :query=>"http://rubyskills.com", :start => 1}).and_return(@request)
    inlinks = Yahoo::SE.inlinks("http://rubyskills.com", :results => 75)
    inlinks.results
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/inlinkData", {:results=>75, :query=>"http://rubyskills.com", :start => 76}).and_return(@request)
    inlinks.next.should == inlinks
    inlinks.results
  end
end