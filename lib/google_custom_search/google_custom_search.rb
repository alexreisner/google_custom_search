require 'net/http'
require 'addressable/uri'

##
# Add search functionality (via Google Custom Search). Protocol reference at:
# http://www.google.com/coop/docs/cse/resultsxml.html
#
module GoogleCustomSearch
  extend self

  ##
  # Search the site.
  #
  def search(query, options = {})
    # Get and parse results.
    uri = build_uri(query, options)
    begin
      return nil unless xml = fetch_xml(uri)
    rescue Timeout::Error => e
      raise GoogleCustomSearch::TimeoutError, e.message
    end

    begin
      data = MultiXml.parse(xml)['GSP']
    rescue MultiXml::ParseError => e
      raise GoogleCustomSearch::InvalidXML, e.message
    end

    # Extract and return search result data, if exists.
    if data['RES']
      ResultSet.new(:total => data['RES']['M'].to_i,
                    :start_index => data['RES']['SN'].to_i,
                    :end_index => data['RES']['EN'].to_i,
                    :per_page => data['PARAM'].detect { |param| param["name"] == "num" }["value"].to_i,
                    :suggestion => data['Spelling'] ? data['Spelling']['Suggestion']['q'] : nil,
                    :results => parse_results(data['RES']['R']))

    else
      ResultSet.new
    end
  end

  ##
  # Expose configuration object
  #
  def configuration
    @configuration ||= GoogleCustomSearch::Configuration.new
  end

  ##
  # Configuration helper method
  #
  def configure
    yield(configuration) if block_given?
  end

  private # -------------------------------------------------------------------

  ##
  # Build search request URI.
  #
  def build_uri(query, options = {})
    options = { :offset => 0, :length => 20 }.merge(options)

    params = {
      :q      => query,
      :start  => options[:offset],
      :num    => options[:length],
      :client => "google-csbe",
      :output => "xml_no_dtd",
      :cx     => GoogleCustomSearch.configuration.cx
    }

    if GoogleCustomSearch.configuration.default_params
      params.merge!(GoogleCustomSearch.configuration.default_params)
    end

    if GoogleCustomSearch.configuration.secure
      uri = Addressable::URI.parse("https://www.google.com/cse")
    else
      uri = Addressable::URI.parse("http://www.google.com/cse")
    end

    uri.query_values = params
    return uri
  end

  ##
  # Query Google, and make sure it responds.
  #
  def fetch_xml(uri)
    http = Net::HTTP.new(uri.host, uri.port)

    if uri.scheme == 'https'
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    http.read_timeout = GoogleCustomSearch.configuration.timeout

    request = Net::HTTP::Get.new(uri.request_uri)
    request.initialize_http_header({ 'User-Agent' => user_agent })

    response = http.request(request)

    raise GoogleCustomSearch::InvalidRequest if response.code.match(/[34]\d{2}/)
    raise GoogleCustomSearch::ServerError if response.code.match(/5\d{2}/)

    response.body
  end

  ##
  # Transform an array of Google search results (XML parsed by REXML) into
  # a more useful format.
  #
  def parse_results(results)
    out = []
    results = [results] if results.is_a?(Hash) # no array if only one result
    results.each do |r|
      out << Result.new(r)
    end
    out
  end

  def user_agent
    "GoogleCustomSearch/#{GoogleCustomSearch::VERSION} - https://github.com/cosm/google_custom_search (Ruby/#{RUBY_VERSION})"
  end
end
