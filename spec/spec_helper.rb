$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'fake_app/fake_app'
require 'rspec/rails'

RSpec.configure do |config|
  config.before :all do
    unless ActiveRecord::Base.connection.table_exists? 'users'
      SetupMigration.up
    end
  end
  config.before :each do
    %w[User Game Tree].each do |klass|
      klass.constantize.delete_all
    end
  end
end
