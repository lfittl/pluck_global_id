require 'rails/railtie'

module PluckGlobalID
  class Railtie < Rails::Railtie
    initializer 'pluck_global_id' do |app|
      ActiveSupport.on_load :active_record do
        ::ActiveRecord::Base.extend PluckGlobalID::RelationMethods
        ::ActiveRecord::Relation.send(:include, PluckGlobalID::RelationMethods)
        ::ActiveRecord::Associations::CollectionProxy.send(:include, PluckGlobalID::RelationMethods)
      end
    end
  end
end
