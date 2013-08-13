require "easy_presenter/filter"
require "rails"

module EasyPresenter
  class Railtie < ::Rails::Railtie
    initializer 'easy_presenter' do
      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send :include, Filter
      end
    end
  end
end