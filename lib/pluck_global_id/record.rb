require 'globalid'

module PluckGlobalID
  class Record
    # Necessary for ActiveJob to detect this as a serialize-able object
    include ::GlobalID::Identification

    def initialize(model_name, model_id, options = {})
      app = options.fetch :app, GlobalID.app
      @global_id = GlobalID.new URI("gid://#{app}/#{model_name}/#{model_id}")
    end

    def to_global_id
      @global_id
    end

    def to_signed_global_id
      fail ArgumentError, 'Not implemented'
    end
  end
end
