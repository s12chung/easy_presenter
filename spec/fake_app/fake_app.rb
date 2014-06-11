require 'rails'
require 'active_record'
require 'action_controller/railtie'
require 'action_view/railtie'

require 'easy_presenter'

# config
ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => ':memory:')

module FakeApp
  class Application < Rails::Application
    config.secret_token = 'Listen to your heart. Be brave. Do what you gotta do.'
    config.session_store :cookie_store, :key => 'session_store'
    config.active_support.deprecation = :log
    config.eager_load = false

    config.root = File.dirname(__FILE__)
  end
end
FakeApp::Application.initialize!

%w[routes migrations].each do |file|
  require "fake_app/#{file}"
end

%w[presenters models controllers helpers].each do |file|
  require "fake_app/app/#{file}"
end