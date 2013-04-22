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
      it "should be configured correctly using defaults if required" do
        GoogleCustomSearch.configuration.cx.should == "1234"
        GoogleCustomSearch.configuration.default_params.should == { :ie => 'utf8' }
        GoogleCustomSearch.configuration.timeout.should == 3
        GoogleCustomSearch.configuration.secure.should == true
      end
    end

    context "build_uri" do
      before(:each) do
        @uri = GoogleCustomSearch.send(:build_uri, "raspberry", { :offset => 10, :length => 10 })
      end

      it "should build the correct search uri" do
        @uri.to_s.should == "https://www.google.com:443/cse?client=google-csbe&cx=1234&ie=utf8&num=10&output=xml_no_dtd&q=raspberry&start=10"
      end

      it "should return non https if secure is false" do
        GoogleCustomSearch.configuration.secure = false
        uri = GoogleCustomSearch.send(:build_uri, "raspberry", { :offset => 10, :length => 10 })
        uri.to_s.should == "http://www.google.com/cse?client=google-csbe&cx=1234&ie=utf8&num=10&output=xml_no_dtd&q=raspberry&start=10"
      end
    end

    context "search" do
      context "with a single result" do
        before(:each) do
          @search_stub = stub_request(:get, "https://www.google.com:443/cse?client=google-csbe&cx=1234&ie=utf8&num=20&output=xml_no_dtd&q=banana&start=0").
            with(:headers => {'User-Agent' => GoogleCustomSearch.send(:user_agent) }).
            to_return(:status => 200, :body => single_result_xml)

          @results = GoogleCustomSearch.search("banana")
        end

        it "should get a page of results" do
          @results.should_not be_nil
        end

        it "should return the current start index" do
          @results.start_index.should == 1
        end

        it "should return the current end index" do
          @results.end_index.should == 1
        end

        it "should return the current page size" do
          @results.per_page.should == 20
        end

        it "should return the total results" do
          @results.total.should == 1
        end

        it "should return a calculated current page number" do
          @results.page.should == 1
        end

        it "should return a calculated total pages" do
          @results.total_pages.should == 1
        end

        it "should have an array of result objects" do
          @results.results.is_a?(Array).should == true
          @results.results.size.should == 1
          @results.results.first.is_a?(GoogleCustomSearch::Result).should == true
        end

        context "the results" do
          before(:each) do
            @result = @results.results.first
          end

          it "should have populated the result object properly" do
            @result.url.should == "https://cosm.com/feeds/1234"
            @result.title.should == "Cosm - Air Quality <b>Banana</b>"
            @result.excerpt.should == "This is the air quality <b>banana</b>!"
          end
        end
      end

      context "multiple results" do
        before(:each) do
          @search_stub = stub_request(:get, "https://www.google.com:443/cse?client=google-csbe&cx=1234&ie=utf8&num=20&output=xml_no_dtd&q=raspberry&start=0").
            with(:headers => {'User-Agent' => GoogleCustomSearch.send(:user_agent) }).
            to_return(:status => 200, :body => multiple_result_xml)

          @results = GoogleCustomSearch.search("raspberry")
        end

        it "should get a page of results" do
          @results.should_not be_nil
        end

        it "should return the current start index" do
          @results.start_index.should == 11
        end

        it "should return the current end index" do
          @results.end_index.should == 12
        end

        it "should return the current page size" do
          @results.per_page.should == 2
        end

        it "should return the total results" do
          @results.total.should == 123
        end

        it "should return a calculated current page number" do
          @results.page.should == 6
        end

        it "should return a calculated total pages" do
          @results.total_pages.should == 62
        end

        it "should have an array of result objects" do
          @results.results.is_a?(Array).should == true
          @results.results.size.should == 2
          @results.results.first.is_a?(GoogleCustomSearch::Result).should == true
        end

        it "should return a spelling suggestion if present" do
          @results.suggestion.should == "raspberry"
        end

        context "the results" do
          before(:each) do
            @result = @results.results.first
          end

          it "should have populated the result object properly" do
            @result.url.should == "https://cosm.com/feeds/1234"
            @result.title.should == "Cosm - Air Quality <b>Raspberry</b> 1"
            @result.excerpt.should == "This is the air quality <b>raspberry</b> one!"
          end
        end
      end

      context "no results" do
        before(:each) do
          @search_stub = stub_request(:get, "https://www.google.com:443/cse?client=google-csbe&cx=1234&ie=utf8&num=20&output=xml_no_dtd&q=raspberry&start=0").
            with(:headers => {'User-Agent' => GoogleCustomSearch.send(:user_agent) }).
            to_return(:status => 200, :body => no_result_xml)

          @results = GoogleCustomSearch.search("raspberry")
        end

        it "should get a page of results" do
          @results.should_not be_nil
        end

        it "should return the total results" do
          @results.total.should == 0
        end

        it "should return an empty array of results" do
          @results.results.should == []
        end

        it "should still return suggestion if present" do
          @results.suggestion.should == "squash"
        end
      end

      context "with bad xml" do
        it "should raise our exception" do
          stub_request(:get, "https://www.google.com:443/cse?client=google-csbe&cx=1234&ie=utf8&num=20&output=xml_no_dtd&q=raspberry&start=0").
            with(:headers => {'User-Agent' => GoogleCustomSearch.send(:user_agent) }).
            to_return(:status => 200, :body => "bad xml")

          expect {
            GoogleCustomSearch.search("raspberry")
          }.to raise_error(GoogleCustomSearch::InvalidXML)
        end
      end

      context "with http errors" do
        it "should raise InvalidRequest on a 300 type response" do
          stub_request(:get, "https://www.google.com:443/cse?client=google-csbe&cx=1234&ie=utf8&num=20&output=xml_no_dtd&q=raspberry&start=0").
            with(:headers => {'User-Agent' => GoogleCustomSearch.send(:user_agent) }).
            to_return(:status => 302)

          expect {
            GoogleCustomSearch.search("raspberry")
          }.to raise_error(GoogleCustomSearch::InvalidRequest)
        end

        it "should raise InvalidRequest on a 400 type response" do
          stub_request(:get, "https://www.google.com:443/cse?client=google-csbe&cx=1234&ie=utf8&num=20&output=xml_no_dtd&q=raspberry&start=0").
            with(:headers => {'User-Agent' => GoogleCustomSearch.send(:user_agent) }).
            to_return(:status => 404)

          expect {
            GoogleCustomSearch.search("raspberry")
          }.to raise_error(GoogleCustomSearch::InvalidRequest)
        end

        it "should raise ServerError on a 500 type response" do
          stub_request(:get, "https://www.google.com:443/cse?client=google-csbe&cx=1234&ie=utf8&num=20&output=xml_no_dtd&q=raspberry&start=0").
            with(:headers => {'User-Agent' => GoogleCustomSearch.send(:user_agent) }).
            to_return(:status => 500)

          expect {
            GoogleCustomSearch.search("raspberry")
          }.to raise_error(GoogleCustomSearch::ServerError)
        end
      end

      context "with a network timeout" do
        it "should raise our timeout exception on timeout" do
          stub_request(:get, "https://www.google.com:443/cse?client=google-csbe&cx=1234&ie=utf8&num=20&output=xml_no_dtd&q=raspberry&start=0").
            with(:headers => {'User-Agent' => GoogleCustomSearch.send(:user_agent) }).
            to_timeout

          expect {
            GoogleCustomSearch.search("raspberry")
          }.to raise_error(GoogleCustomSearch::TimeoutError)
        end
      end
    end
  end
end
