require File.join(File.dirname(__FILE__), "..", "..", "spec_helper")

describe Yahoo::SE::Inlinks do
  it "should have the service path for the inlinks service" do
    Yahoo::SE::Inlinks::SERVICE_PATH.should == "http://search.yahooapis.com/SiteExplorerService/V1/inlinkData"
  end
end