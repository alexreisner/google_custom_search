##
# Simple class to hold a collection of search result data.
#
class GoogleCustomSearch::ResultSet
  attr_reader :total, :pages, :suggestion, :labels

  def self.create(xml_hash)
    self.new(xml_hash['RES']['M'].to_i,
             parse_results(xml_hash['RES']['R']),
             spelling = xml_hash['SPELLING'] ? spelling['SUGGESTION'] : nil,
             parse_labels(xml_hash))
  end

  def self.create_empty
    self.new(0, [], nil, {})
  end

  def self.parse_results(res_r)
    GoogleCustomSearch::Result.parse(res_r)
  end

  def self.parse_labels(xml_hash)
    return {} unless context = xml_hash['Context'] and facets = context['Facet']
    facets.map do |f|
      (fi = f['FacetItem']).is_a?(Array) ? fi : [fi]
    end.inject({}) do |h, facet_item|
      facet_item.each do |element|
        h[element['label']] = element['anchor_text']
      end
      h
    end
  end

  def initialize(total, pages, suggestion, labels)
    @total, @pages, @suggestion, @labels = total, pages, suggestion, labels
  end
end
  
