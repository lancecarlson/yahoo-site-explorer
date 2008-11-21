require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Yahoo::SE::Pages do
  before do
    @result1 = mock(Yahoo::SE::Result)
    @response = mock(Yahoo::SE::Response, :total_results_available => 120)
    @request = mock(Yahoo::SE::Request, :results => [@result1], :response => @response)
  end
  
  describe "Class" do
    it "should list all of the results for a given page request" do
      pages = Yahoo::SE.pages("http://erbmicha.com")
      results = Yahoo::SE.all(pages)
      results.length.should == 303
    end
    
    it "should list all of the results for a given page request" do
      pages = Yahoo::SE.pages("http://rubyskills.com/contact")
      results = Yahoo::SE.all(pages)
      results.length.should == 1
    end
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
    pages.last?.should be_false
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/pageData", {:results=>44, :query=>"http://rubyskills.com", :start => 76}).and_return(@request)
    pages.next.should == [@result1]
  end
  
  it "should return the total results from the response" do
    Yahoo::SE.application_id = "123"
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/pageData", {:results=>100, :start=>1, :query=>"http://rubyskills.com"}).and_return(@request)
    pages = Yahoo::SE.pages("http://rubyskills.com", :results => 100)
    pages.results
    pages.total_results_available.should == 120
  end
end