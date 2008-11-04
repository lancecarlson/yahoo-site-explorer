require File.join(File.dirname(__FILE__), "spec_helper")

describe Yahoo::SE do
  it "should have an application id accessor" do
    Yahoo::SE.application_id = "something"
    Yahoo::SE.application_id.should == "something"
  end
  
  it "should have a path to the service api" do
    Yahoo::SE::SERVICE_PATH.should == "http://search.yahooapis.com/SiteExplorerService/V1"
  end
end