require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Yahoo::SE::Request do
  describe "hash_to_query" do
    it "should convert a hash to a query string" do
      Yahoo::SE::Request.hash_to_query(:appid => "123", :query => "http://www.rubyskills.com", :results => 100).should == "query=http://www.rubyskills.com&results=100&appid=123"
    end
  end
  
  describe "instances" do
    before do
      Yahoo::SE.application_id = "123"
      @result = mock(Yahoo::SE::Result)
      @il_request = Yahoo::SE::Request.new(Yahoo::SE::Inlinks::SERVICE_PATH, :query => "http://www.rubyskills.com")
      @json_file = mock(File)
      @json_file.stub!(:readlines).and_return(@json_file)
      @json_file.stub!(:join).and_return(fixture("erbmicha.com_backlinks.json"))
    end
    
    it "should form a valid request to inlink data" do
      Yahoo::SE::Result.should_receive(:new).exactly(100).times.and_return(@result)
      @il_request.should_receive("open").with("http://search.yahooapis.com/SiteExplorerService/V1/inlinkData?query=http://www.rubyskills.com&output=json&appid=123").and_return(@json_file)
      @il_request.results.size.should == 100
    end
  end
end