require 'test_helper'

class GoogleCustomSearchTest < ActiveSupport::TestCase
  test "returns an array of results" do
    results = GoogleCustomSearch.search('science')
    assert(results.pages.size > 0)
  end
end

