require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Yahoo::SE::UpdateNotification do
  before do
    @response = mock(Yahoo::SE::Response)
    @request = mock(Yahoo::SE::Request, :response => @response)
  end
  
  it "should have the service path for the updateNotification service" do
    Yahoo::SE::UpdateNotification::SERVICE_PATH.should == "http://search.yahooapis.com/SiteExplorerService/V1/updateNotification"
  end
  
  it "should return a successful JSON message" do
    Yahoo::SE.application_id = "123"
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/updateNotification", {:url=>"erbmicha.com"}).and_return(@request)
    Yahoo::SE.update_notification("erbmicha.com")
  end
end