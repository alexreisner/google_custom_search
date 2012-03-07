require 'test_helper'

class GoogleCustomSearchTest < ActiveSupport::TestCase
  test "returns an array of results" do
    results = GoogleCustomSearch.search('engineer')
    assert(! results.pages.empty?)
    assert(! results.labels.empty?)

    label_set = results.pages.inject(Set[]) do |label_set, page|
      assert(page.title.is_a?(String))
      assert(! page.title.empty?)

      assert(page.url.is_a?(String))
      URI.parse(page.url)

      assert(page.description.is_a?(String))
      assert(! page.description.empty?)

      label_set += page.labels
    end

    assert(! (label_set & results.labels.keys.to_set).empty?)
  end
end

