module GoogleCustomSearch
  class Result
    attr_accessor :url, :title, :excerpt

    def initialize(hash)
      @url = hash['U']
      @title = hash['T'].sub(/ \[[^\]]*\]$/, '') if hash['T']
      @excerpt = hash['S'].gsub('<br', '') if hash['S']
    end
  end
end
