require 'spec_helper'

describe GoogleCustomSearch::Configuration do
  before(:each) do
    @configuration = GoogleCustomSearch::Configuration.new
    @configuration.cx = "12345"
    @configuration.default_params = { :ie => 'utf8', :oe => 'utf8' }
    @configuration.timeout = 5
    @configuration.secure = false
  end

  it "should allow setting of google_search_cx" do
    @configuration.cx.should == "12345"
  end

  it "should allow setting of google_search_params" do
    @configuration.default_params.should == { :ie => 'utf8', :oe => 'utf8' }
  end

  it "should allow setting of timeout" do
    @configuration.timeout.should == 5
  end

  it "should have set the secure flag" do
    @configuration.secure.should == false
  end

  it "should expose a reset method" do
    @configuration.reset!
    @configuration.cx.should be_nil
    @configuration.default_params.should be_nil
    @configuration.timeout.should == 3
    @configuration.secure.should == true
  end
end
