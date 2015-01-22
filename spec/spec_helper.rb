require 'bundler/setup'
require 'rails/all'
require 'pluck_global_id'

class Sample < ActiveRecord::Base
  include GlobalID::Identification
end

RSpec.configure do |config|
  config.before(:suite) do
    PluckGlobalID::Railtie.run_initializers
    GlobalID.app = 'sample'

    ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'

    ActiveRecord::Migration.create_table :samples do |t|
      t.string :name
    end
  end

  config.before(:each) do
    Sample.delete_all
  end
end
