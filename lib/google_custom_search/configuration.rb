module GoogleCustomSearch
  module Configuration
    extend self

    attr_accessor :cx, :default_params

    def reset!
      @cx = nil
      @default_params = nil
    end
  end
end
