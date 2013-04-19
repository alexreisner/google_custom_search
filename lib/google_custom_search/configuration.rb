module GoogleCustomSearch
  class Configuration

    attr_accessor :cx,
      :default_params,
      :timeout,
      :secure

    def initialize
      reset!
    end

    def reset!
      @cx = nil
      @default_params = nil
      @timeout = 3
      @secure = true
    end
  end
end
