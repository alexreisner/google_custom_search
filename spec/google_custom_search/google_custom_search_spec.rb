require 'spec_helper'

describe GoogleCustomSearch do
  before(:each) do
    GoogleCustomSearch.configuration.reset!
  end

  context "when not configured" do
    before(:each) do
      GoogleCustomSearch.instance_variable_set(:@configuration, nil)
    end

    it "should return a config object" do
      GoogleCustomSearch.configuration.should_not be_nil
      GoogleCustomSearch.configuration.cx.should be_nil
      GoogleCustomSearch.configuration.default_params.should be_nil
    end

    it "should allow setting instance variables immediately" do
      GoogleCustomSearch.configuration.cx = "4567"
      GoogleCustomSearch.configuration.cx.should == "4567"
    end
  end

  context "when configured" do
    before(:each) do
      GoogleCustomSearch.configure do |config|
        config.cx = "1234"
        config.default_params = { :ie => 'utf8' }
      end
    end

    context "configuration" do
      it "should be configured correctly" do
        GoogleCustomSearch.configuration.cx.should == "1234"
        GoogleCustomSearch.configuration.default_params.should == { :ie => 'utf8' }
      end
    end
  end
end
