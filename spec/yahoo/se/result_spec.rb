require File.join(File.dirname(__FILE__), "..", "..", "spec_helper")

describe Yahoo::SE::Result do
  before do
    Yahoo::SE::Result.new({"Title" => "The Knuckleball","Url" => "http://erbmicha.com/2008/04/19/the-knuckleball/","ClickUrl"=>"http://erbmicha.com/2008/04/19/the-knuckleball/"})
  end
  
  it "should have a title" do
    @result.title.should == "The Knuckleball"
  end
  
  it "should have a url" do
    @result.url.should == "The Knuckleball"
  end
  
  it "should have a click url" do
    @result.click_url.should == "http://erbmicha.com/2008/04/19/the-knuckleball/"
  end
end

