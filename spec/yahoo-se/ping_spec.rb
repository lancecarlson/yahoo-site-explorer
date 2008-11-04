require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Yahoo::SE::Ping do
  before do
    @response = mock(Yahoo::SE::Response)
    @request = mock(Yahoo::SE::Request, :response => @response)
  end
  
  it "should have the service path for the ping service" do
    Yahoo::SE::Ping::SERVICE_PATH.should == "http://search.yahooapis.com/SiteExplorerService/V1/ping"
  end
  
  it "should return a successful XML message" do
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/ping", {:sitemap=>"erbmicha.com"}).and_return(@request)
    Yahoo::SE.ping("erbmicha.com")
  end
end