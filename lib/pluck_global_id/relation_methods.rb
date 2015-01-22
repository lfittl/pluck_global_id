module PluckGlobalID
  module RelationMethods
    def pluck_global_id(options = {})
      pluck(:id).map do |id|
        PluckGlobalID::Record.new self.name, id
      end
    end
  end
end
