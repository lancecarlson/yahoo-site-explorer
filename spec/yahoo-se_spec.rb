require File.join(File.dirname(__FILE__), "spec_helper")

describe Yahoo::SE do
  it "should have an application id accessor" do
    Yahoo::SE.application_id = "something"
    Yahoo::SE.application_id.should == "something"
  end
  
  it "should have a path to the service api" do
    Yahoo::SE::SERVICE_PATH.should == "http://search.yahooapis.com/SiteExplorerService/V1"
  end
  
  it "should return the results after a ResponseError was raised" do
    Yahoo::SE.application_id = "123"
    @url = "http://vielmetti.typepad.com/vacuum"
    @results = Yahoo::SE.all(::Yahoo::SE.pages(@url, :results => 100))
    @results.size.should > 0
  end
end