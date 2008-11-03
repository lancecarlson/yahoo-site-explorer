require File.join(File.dirname(__FILE__), "..", "..", "spec_helper")

describe Yahoo::SE::Pages do
  it "should have the service path for the pages service" do
    Yahoo::SE::Pages::SERVICE_PATH.should == "http://search.yahooapis.com/SiteExplorerService/V1/pageData"
  end
end