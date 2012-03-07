##
# Add search functionality (via Google Custom Search). Protocol reference at:
# http://www.google.com/coop/docs/cse/resultsxml.html
#
require 'net/http'
require 'active_support/core_ext'

module GoogleCustomSearch
  autoload :ResultSet, 'result_set'
  autoload :Result, 'result'

  extend self

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
      ResultSet.create(data)
    else
      ResultSet.create_empty()
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
end
