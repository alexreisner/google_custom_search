require 'spec_helper'

describe GoogleCustomSearch::Configuration do
  before(:each) do
    GoogleCustomSearch::Configuration.cx = "12345"
    GoogleCustomSearch::Configuration.default_params = { :ie => 'utf8', :oe => 'utf8' }
  end

  it "should allow setting of google_search_cx" do
    GoogleCustomSearch::Configuration.cx.should == "12345"
  end

  it "should allow setting of google_search_params" do
    GoogleCustomSearch::Configuration.default_params.should == { :ie => 'utf8', :oe => 'utf8' }
  end

  it "should expose a reset method" do
    GoogleCustomSearch::Configuration.reset!
    GoogleCustomSearch::Configuration.cx.should be_nil
    GoogleCustomSearch::Configuration.default_params.should be_nil
  end
end
