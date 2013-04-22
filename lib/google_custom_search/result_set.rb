module GoogleCustomSearch
  class ResultSet
    attr_accessor :total, :results, :per_page, :start_index, :end_index, :suggestion

    def initialize(options = {})
      @total = options[:total] || 0
      @results = options[:results] || []
      @per_page = options[:per_page]
      @start_index = options[:start_index]
      @end_index = options[:end_index]
      @suggestion = options[:suggestion]
    end

    # calculate current page
    def page
      (@start_index.to_f / @per_page).ceil
    end

    def total_pages
      (@total.to_f / @per_page).ceil
    end
  end
end
