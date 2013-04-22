module GoogleCustomSearch
  class Error < StandardError; end
  class TimeoutError < Error; end
  class InvalidXML < Error; end
  class InvalidRequest < Error; end
  class ServerError < Error; end
end
