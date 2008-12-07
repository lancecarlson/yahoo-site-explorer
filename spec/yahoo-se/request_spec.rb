require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Yahoo::SE::Request do
  describe "hash_to_query" do
    it "should convert a hash to a query string" do
      Yahoo::SE::Request.hash_to_query(:appid => "123", :query => "http://erbmicha.com", :results => 100).should == "appid=123&query=http://erbmicha.com&results=100"
    end
  end
  
  describe "instances" do
    before do
      Yahoo::SE.application_id = "123"
      Yahoo::SE::Request.stub!(:hash_to_query).and_return("appid=123&query=http://erbmicha.com&output=json")
      @result = mock(Yahoo::SE::Result)
      @il_request = Yahoo::SE::Request.new(Yahoo::SE::Inlinks::SERVICE_PATH, :query => "http://erbmicha.com")
      @pages_request = Yahoo::SE::Request.new(Yahoo::SE::Pages::SERVICE_PATH, :query => "http://erbmicha.com")
      @ping_request = Yahoo::SE::Request.new(Yahoo::SE::Ping::SERVICE_PATH, :sitemap => "http://erbmicha.com")
      @update_notification_request = Yahoo::SE::Request.new(Yahoo::SE::UpdateNotification::SERVICE_PATH, :url => "http://erbmicha.com")
      @json_bl_file = mock(File)
      @json_bl_file.stub!(:readlines).and_return(@json_bl_file)
      @json_bl_file.stub!(:join).and_return(fixture("erbmicha.com_backlinks.json"))
      @json_pages_file = mock(File)
      @json_pages_file.stub!(:readlines).and_return(@json_pages_file)
      @json_pages_file.stub!(:join).and_return(fixture("erbmicha.com_pages.json"))
      @json_ping_file = mock(File)
      @json_ping_file.stub!(:readlines).and_return(@json_ping_file)
      @json_ping_file.stub!(:join).and_return(fixture("erbmicha.com_ping.json"))
    end
    
    it "should form a valid request to inlink data" do
      Yahoo::SE::Result.should_receive(:new).exactly(100).times.and_return(@result)
      @il_request.should_receive("open").with("http://search.yahooapis.com/SiteExplorerService/V1/inlinkData?appid=123&query=http://erbmicha.com&output=json", {"User-Agent"=>"Ruby/Yahoo Site Explorer Gem vV1"}).and_return(@json_bl_file)
      @il_request.results.size.should == 100
    end
    
    it "should form a valid request to page data" do
      Yahoo::SE::Result.should_receive(:new).exactly(50).times.and_return(@result)
      @pages_request.should_receive("open").with("http://search.yahooapis.com/SiteExplorerService/V1/pageData?appid=123&query=http://erbmicha.com&output=json", {"User-Agent"=>"Ruby/Yahoo Site Explorer Gem vV1"}).and_return(@json_pages_file)
      @pages_request.results.size.should == 50
    end
    
    it "should form a valid request to ping a site" do
      @ping_request.should_receive("open").with("http://search.yahooapis.com/SiteExplorerService/V1/ping?appid=123&query=http://erbmicha.com&output=json", {"User-Agent"=>"Ruby/Yahoo Site Explorer Gem vV1"}).and_return(@json_ping_file)
      @ping_request.response
    end
    
    it "should form a valid request to the update notification service" do
      @update_notification_request.should_receive("open").with("http://search.yahooapis.com/SiteExplorerService/V1/updateNotification?appid=123&query=http://erbmicha.com&output=json", {"User-Agent"=>"Ruby/Yahoo Site Explorer Gem vV1"}).and_return(@json_ping_file)
      @update_notification_request.response
    end
  end
end