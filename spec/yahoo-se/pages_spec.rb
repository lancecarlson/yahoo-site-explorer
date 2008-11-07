require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Yahoo::SE::Pages do
  before do
    @result1 = mock(Yahoo::SE::Result)
    @response = mock(Yahoo::SE::Response, :total_results => 11)
    @request = mock(Yahoo::SE::Request, :results => [@result1], :response => @response)
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
    pages2 = mock(Yahoo::SE::Pages)
    Yahoo::SE.application_id = "123"
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/pageData", {:results=>75, :query=>"http://rubyskills.com", :start => 1}).and_return(@request)
    pages = Yahoo::SE.pages("http://rubyskills.com", :results => 75)
    pages.results
    Yahoo::SE::Pages.should_receive(:new).with("http://rubyskills.com", {:results=>75, :start=>76}).and_return(pages2)
    pages.next.should == pages2
    pages.results
  end
  
  it "should return the total results from the response" do
    Yahoo::SE.application_id = "123"
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/pageData", {:results=>100, :start=>1, :query=>"http://rubyskills.com"}).and_return(@request)
    Yahoo::SE.pages("http://rubyskills.com", :results => 100).total_results.should == 11
  end
end