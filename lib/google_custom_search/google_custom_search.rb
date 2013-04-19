##
# Add search functionality (via Google Custom Search). Protocol reference at:
# http://www.google.com/coop/docs/cse/resultsxml.html
#
module GoogleCustomSearch
  extend self

  ##
  # Quick Struct-based class to hold a collection of search result data.
  #
  class ResultSet < Struct.new(:total, :pages, :suggestion); end

  ##
  # Quick Struct-based class to hold data for a single search result.
  #
  class Result < Struct.new(:url, :title, :description); end

  ##
  # Search the site.
  #
  def search(query, offset = 0, length = 20)

    # Get and parse results.
    url = url(query, offset, length)
    return nil unless xml = fetch_xml(url)
    data = Hash.from_xml(xml)['GSP']

    # Extract and return search result data, if exists.
    if data['RES']
      ResultSet.new(
        data['RES']['M'].to_i,                                  # total
        parse_results(data['RES']['R']),                        # pages
        data['SPELLING'] ? data['SPELLING']['SUGGESTION'] : nil # suggestion
      )
    else
      ResultSet.new(0, [], nil)
    end
  end


  private # -------------------------------------------------------------------

  ##
  # Build search request URL.
  #
  def url(query, offset = 0, length = 20)
    params = {
      :q      => query,
      :start  => offset,
      :num    => length,
      :client => "google-csbe",
      :output => "xml_no_dtd",
      :cx     => GOOGLE_SEARCH_CX
    }
    begin
      params.merge!(GOOGLE_SEARCH_PARAMS)
    rescue NameError
    end
    "http://www.google.com/search?" + params.to_query
  end

  ##
  # Query Google, and make sure it responds.
  #
  def fetch_xml(url)
    begin
      resp = nil
      timeout(3) do
        resp = Net::HTTP.get_response(URI.parse(url))
      end
    rescue SocketError, TimeoutError; end
    (resp and resp.code == "200") ? resp.body : nil
  end

  ##
  # Transform an array of Google search results (XML parsed by REXML) into
  # a more useful format.
  #
  def parse_results(results)
    out = []
    results = [results] if results.is_a?(Hash) # no array if only one result
    results.each do |r|
      out << Result.new(
        r['U'],                               # url
        r['T'].try(:sub, / \[[^\]]*\]$/, ''), # title
        r['S'].try(:gsub, '<br>', '')         # desciption
      )
    end
    out
  end
end
