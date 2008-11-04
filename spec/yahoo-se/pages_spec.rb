require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Yahoo::SE::Pages do
  before do
    @result1 = mock(Yahoo::SE::Result)
    @request = mock(Yahoo::SE::Request, :results => [@result1])
  end
  
  it "should have the service path for the pages service" do
    Yahoo::SE::Pages::SERVICE_PATH.should == "http://search.yahooapis.com/SiteExplorerService/V1/pageData"
  end
  
  it "should return 50 page results" do
    Yahoo::SE.application_id = "123"
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/pageData", {:query=>"erbmicha.com", :results => 50, :start => 1}).and_return(@request)
    Yahoo::SE.pages("erbmicha.com").results
  end
  
  it "should return the next 75 inlink results" do
    Yahoo::SE.application_id = "123"
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/pageData", {:results=>75, :query=>"http://rubyskills.com", :start => 1}).and_return(@request)
    pages = Yahoo::SE.pages("http://rubyskills.com", :results => 75)
    pages.results
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/pageData", {:results=>75, :query=>"http://rubyskills.com", :start => 76}).and_return(@request)
    pages.next.should == pages
    pages.results
  end
end